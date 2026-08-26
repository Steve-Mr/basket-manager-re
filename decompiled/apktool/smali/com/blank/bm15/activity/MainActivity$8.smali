.class Lcom/blank/bm15/activity/MainActivity$8;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blank/bm15/activity/MainActivity;->createPage()V
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
.field final synthetic this$0:Lcom/blank/bm15/activity/MainActivity;

.field private final synthetic val$listView:Landroid/widget/ListView;


# direct methods
.method constructor <init>(Lcom/blank/bm15/activity/MainActivity;Landroid/widget/ListView;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/blank/bm15/activity/MainActivity$8;->this$0:Lcom/blank/bm15/activity/MainActivity;

    iput-object p2, p0, Lcom/blank/bm15/activity/MainActivity$8;->val$listView:Landroid/widget/ListView;

    .line 280
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
    .line 283
    .local p1, "arg0":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v1, p0, Lcom/blank/bm15/activity/MainActivity$8;->val$listView:Landroid/widget/ListView;

    invoke-virtual {v1, p3}, Landroid/widget/ListView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/model/object/crud/Game;

    .line 284
    .local v0, "game":Lcom/blank/bm15/model/object/crud/Game;
    iget-object v1, p0, Lcom/blank/bm15/activity/MainActivity$8;->this$0:Lcom/blank/bm15/activity/MainActivity;

    invoke-virtual {v1, v0}, Lcom/blank/bm15/activity/MainActivity;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 285
    iget-object v1, p0, Lcom/blank/bm15/activity/MainActivity$8;->this$0:Lcom/blank/bm15/activity/MainActivity;

    const-string v2, "GAME_ID"

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Game;->getId()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-static {v1, v2, v3}, Lcom/blank/bm15/dao/utils/BlankSharedPreferences;->setInt(Landroid/content/Context;Ljava/lang/String;I)V

    .line 286
    iget-object v1, p0, Lcom/blank/bm15/activity/MainActivity$8;->this$0:Lcom/blank/bm15/activity/MainActivity;

    const/16 v2, 0xf

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Lcom/blank/bm15/activity/base/BaseActivity;->resetNavigation(Landroid/content/Context;Ljava/lang/Integer;Ljava/lang/Integer;)V

    .line 287
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 288
    iget-object v1, p0, Lcom/blank/bm15/activity/MainActivity$8;->this$0:Lcom/blank/bm15/activity/MainActivity;

    new-instance v2, Landroid/content/Intent;

    iget-object v3, p0, Lcom/blank/bm15/activity/MainActivity$8;->this$0:Lcom/blank/bm15/activity/MainActivity;

    const-class v4, Lcom/blank/bm15/activity/HomeActivity;

    invoke-direct {v2, v3, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v1, v2}, Lcom/blank/bm15/activity/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 292
    :goto_0
    return-void

    .line 290
    :cond_0
    iget-object v1, p0, Lcom/blank/bm15/activity/MainActivity$8;->this$0:Lcom/blank/bm15/activity/MainActivity;

    new-instance v2, Landroid/content/Intent;

    iget-object v3, p0, Lcom/blank/bm15/activity/MainActivity$8;->this$0:Lcom/blank/bm15/activity/MainActivity;

    const-class v4, Lcom/blank/bm15/activity/SelectTeamActivity;

    invoke-direct {v2, v3, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v1, v2}, Lcom/blank/bm15/activity/MainActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method
