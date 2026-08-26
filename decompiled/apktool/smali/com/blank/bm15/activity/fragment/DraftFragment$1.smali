.class Lcom/blank/bm15/activity/fragment/DraftFragment$1;
.super Ljava/lang/Object;
.source "DraftFragment.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blank/bm15/activity/fragment/DraftFragment;->loadList(Landroid/view/View;)V
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
.field final synthetic this$0:Lcom/blank/bm15/activity/fragment/DraftFragment;

.field private final synthetic val$listView:Landroid/widget/ListView;

.field private final synthetic val$rootView:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/blank/bm15/activity/fragment/DraftFragment;Landroid/widget/ListView;Landroid/view/View;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/blank/bm15/activity/fragment/DraftFragment$1;->this$0:Lcom/blank/bm15/activity/fragment/DraftFragment;

    iput-object p2, p0, Lcom/blank/bm15/activity/fragment/DraftFragment$1;->val$listView:Landroid/widget/ListView;

    iput-object p3, p0, Lcom/blank/bm15/activity/fragment/DraftFragment$1;->val$rootView:Landroid/view/View;

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 8
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
    const/4 v4, 0x1

    const/4 v7, 0x0

    .line 59
    iget-object v5, p0, Lcom/blank/bm15/activity/fragment/DraftFragment$1;->val$listView:Landroid/widget/ListView;

    invoke-virtual {v5, p3}, Landroid/widget/ListView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/blank/bm15/model/object/crud/Player;

    .line 60
    .local v2, "player":Lcom/blank/bm15/model/object/crud/Player;
    iget-object v5, p0, Lcom/blank/bm15/activity/fragment/DraftFragment$1;->this$0:Lcom/blank/bm15/activity/fragment/DraftFragment;

    invoke-static {v5}, Lcom/blank/bm15/activity/fragment/DraftFragment;->access$0(Lcom/blank/bm15/activity/fragment/DraftFragment;)Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const/16 v6, 0xe8

    if-ne v5, v6, :cond_1

    move v3, v4

    .line 62
    .local v3, "round":I
    :goto_0
    new-instance v0, Lcom/blank/bm15/model/object/crud/DraftRound;

    iget-object v5, p0, Lcom/blank/bm15/activity/fragment/DraftFragment$1;->this$0:Lcom/blank/bm15/activity/fragment/DraftFragment;

    invoke-static {v5}, Lcom/blank/bm15/activity/fragment/DraftFragment;->access$1(Lcom/blank/bm15/activity/fragment/DraftFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v5

    invoke-direct {v0, v5}, Lcom/blank/bm15/model/object/crud/DraftRound;-><init>(Landroid/content/Context;)V

    .line 63
    .local v0, "draftRoundFilter":Lcom/blank/bm15/model/object/crud/DraftRound;
    iget-object v5, p0, Lcom/blank/bm15/activity/fragment/DraftFragment$1;->this$0:Lcom/blank/bm15/activity/fragment/DraftFragment;

    invoke-static {v5}, Lcom/blank/bm15/activity/fragment/DraftFragment;->access$0(Lcom/blank/bm15/activity/fragment/DraftFragment;)Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v5

    invoke-virtual {v0, v5}, Lcom/blank/bm15/model/object/crud/DraftRound;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 64
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v0, v5}, Lcom/blank/bm15/model/object/crud/DraftRound;->setRound(Ljava/lang/Integer;)V

    .line 65
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v1

    .line 66
    .local v1, "draftRoundList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/DraftRound;>;"
    new-instance v5, Lcom/blank/bm15/model/comparator/DraftRoundComparator;

    invoke-direct {v5, v7, v4}, Lcom/blank/bm15/model/comparator/DraftRoundComparator;-><init>(II)V

    invoke-static {v1, v5}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 67
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_0

    invoke-interface {v1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/blank/bm15/model/object/crud/DraftRound;

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/DraftRound;->getTeamUser()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iget-object v5, p0, Lcom/blank/bm15/activity/fragment/DraftFragment$1;->this$0:Lcom/blank/bm15/activity/fragment/DraftFragment;

    invoke-static {v5}, Lcom/blank/bm15/activity/fragment/DraftFragment;->access$0(Lcom/blank/bm15/activity/fragment/DraftFragment;)Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-eq v4, v5, :cond_2

    .line 68
    :cond_0
    iget-object v4, p0, Lcom/blank/bm15/activity/fragment/DraftFragment$1;->this$0:Lcom/blank/bm15/activity/fragment/DraftFragment;

    iget-object v5, p0, Lcom/blank/bm15/activity/fragment/DraftFragment$1;->val$rootView:Landroid/view/View;

    invoke-static {v4, v5, v2, v3}, Lcom/blank/bm15/activity/fragment/DraftFragment;->access$2(Lcom/blank/bm15/activity/fragment/DraftFragment;Landroid/view/View;Lcom/blank/bm15/model/object/crud/Player;I)V

    .line 72
    :goto_1
    return-void

    .line 60
    .end local v0    # "draftRoundFilter":Lcom/blank/bm15/model/object/crud/DraftRound;
    .end local v1    # "draftRoundList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/DraftRound;>;"
    .end local v3    # "round":I
    :cond_1
    const/4 v3, 0x2

    goto :goto_0

    .line 70
    .restart local v0    # "draftRoundFilter":Lcom/blank/bm15/model/object/crud/DraftRound;
    .restart local v1    # "draftRoundList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/DraftRound;>;"
    .restart local v3    # "round":I
    :cond_2
    iget-object v5, p0, Lcom/blank/bm15/activity/fragment/DraftFragment$1;->this$0:Lcom/blank/bm15/activity/fragment/DraftFragment;

    iget-object v6, p0, Lcom/blank/bm15/activity/fragment/DraftFragment$1;->val$rootView:Landroid/view/View;

    invoke-interface {v1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/blank/bm15/model/object/crud/DraftRound;

    invoke-static {v5, v6, v2, v3, v4}, Lcom/blank/bm15/activity/fragment/DraftFragment;->access$3(Lcom/blank/bm15/activity/fragment/DraftFragment;Landroid/view/View;Lcom/blank/bm15/model/object/crud/Player;ILcom/blank/bm15/model/object/crud/DraftRound;)V

    goto :goto_1
.end method
