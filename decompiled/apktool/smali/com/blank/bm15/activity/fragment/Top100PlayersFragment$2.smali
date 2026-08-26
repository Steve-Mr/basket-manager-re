.class Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$2;
.super Ljava/lang/Object;
.source "Top100PlayersFragment.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;->create()V
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
.field final synthetic this$0:Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;

.field private final synthetic val$listView:Landroid/widget/ListView;


# direct methods
.method constructor <init>(Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;Landroid/widget/ListView;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$2;->this$0:Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;

    iput-object p2, p0, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$2;->val$listView:Landroid/widget/ListView;

    .line 117
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 5
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
    .line 120
    .local p1, "arg0":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$2;->val$listView:Landroid/widget/ListView;

    invoke-virtual {v1, p3}, Landroid/widget/ListView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/model/object/crud/Player;

    .line 121
    .local v0, "player":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 122
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$2;->this$0:Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;->access$0(Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v1

    const/16 v2, 0xb

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/blank/bm15/activity/base/BaseActivity;->addNavigation(Landroid/content/Context;Ljava/lang/Integer;Ljava/lang/Integer;)V

    .line 123
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$2;->this$0:Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;->access$0(Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v1

    new-instance v2, Landroid/content/Intent;

    iget-object v3, p0, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$2;->this$0:Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;

    invoke-static {v3}, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;->access$0(Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v3

    const-class v4, Lcom/blank/bm15/activity/HomeActivity;

    invoke-direct {v2, v3, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v1, v2}, Lcom/blank/bm15/activity/HomeActivity;->startActivity(Landroid/content/Intent;)V

    .line 125
    :cond_0
    return-void
.end method
