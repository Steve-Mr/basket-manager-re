.class Lcom/blank/bm15/activity/fragment/DraftFragment$3;
.super Ljava/lang/Object;
.source "DraftFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blank/bm15/activity/fragment/DraftFragment;->createSelectPlayerAlert(Landroid/view/View;Lcom/blank/bm15/model/object/crud/Player;ILcom/blank/bm15/model/object/crud/DraftRound;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/blank/bm15/activity/fragment/DraftFragment;

.field private final synthetic val$draftRound:Lcom/blank/bm15/model/object/crud/DraftRound;

.field private final synthetic val$player:Lcom/blank/bm15/model/object/crud/Player;

.field private final synthetic val$rootView:Landroid/view/View;

.field private final synthetic val$round:I


# direct methods
.method constructor <init>(Lcom/blank/bm15/activity/fragment/DraftFragment;Lcom/blank/bm15/model/object/crud/Player;ILcom/blank/bm15/model/object/crud/DraftRound;Landroid/view/View;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/blank/bm15/activity/fragment/DraftFragment$3;->this$0:Lcom/blank/bm15/activity/fragment/DraftFragment;

    iput-object p2, p0, Lcom/blank/bm15/activity/fragment/DraftFragment$3;->val$player:Lcom/blank/bm15/model/object/crud/Player;

    iput p3, p0, Lcom/blank/bm15/activity/fragment/DraftFragment$3;->val$round:I

    iput-object p4, p0, Lcom/blank/bm15/activity/fragment/DraftFragment$3;->val$draftRound:Lcom/blank/bm15/model/object/crud/DraftRound;

    iput-object p5, p0, Lcom/blank/bm15/activity/fragment/DraftFragment$3;->val$rootView:Landroid/view/View;

    .line 97
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "id"    # I

    .prologue
    .line 99
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/DraftFragment$3;->val$player:Lcom/blank/bm15/model/object/crud/Player;

    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/DraftFragment$3;->this$0:Lcom/blank/bm15/activity/fragment/DraftFragment;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/DraftFragment;->access$0(Lcom/blank/bm15/activity/fragment/DraftFragment;)Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Player;->setTeam(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 100
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/DraftFragment$3;->val$player:Lcom/blank/bm15/model/object/crud/Player;

    iget v1, p0, Lcom/blank/bm15/activity/fragment/DraftFragment$3;->val$round:I

    iget-object v2, p0, Lcom/blank/bm15/activity/fragment/DraftFragment$3;->val$draftRound:Lcom/blank/bm15/model/object/crud/DraftRound;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/DraftRound;->getPosition()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/ManageDraft;->setDraftPlayerSalaryAndYearsContract(Lcom/blank/bm15/model/object/crud/Player;II)V

    .line 101
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/DraftFragment$3;->val$player:Lcom/blank/bm15/model/object/crud/Player;

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 102
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/DraftFragment$3;->val$draftRound:Lcom/blank/bm15/model/object/crud/DraftRound;

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->delete(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 105
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/DraftFragment$3;->this$0:Lcom/blank/bm15/activity/fragment/DraftFragment;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/DraftFragment;->access$0(Lcom/blank/bm15/activity/fragment/DraftFragment;)Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v0

    iget v1, p0, Lcom/blank/bm15/activity/fragment/DraftFragment$3;->val$round:I

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/core/ManageDraft;->playDraft(Lcom/blank/bm15/model/object/crud/Game;IZ)V

    .line 106
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/DraftFragment$3;->this$0:Lcom/blank/bm15/activity/fragment/DraftFragment;

    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/DraftFragment$3;->val$rootView:Landroid/view/View;

    invoke-static {v0, v1}, Lcom/blank/bm15/activity/fragment/DraftFragment;->access$4(Lcom/blank/bm15/activity/fragment/DraftFragment;Landroid/view/View;)V

    .line 107
    return-void
.end method
