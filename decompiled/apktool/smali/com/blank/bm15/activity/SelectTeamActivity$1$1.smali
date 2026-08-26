.class Lcom/blank/bm15/activity/SelectTeamActivity$1$1;
.super Ljava/lang/Object;
.source "SelectTeamActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blank/bm15/activity/SelectTeamActivity$1;->onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/blank/bm15/activity/SelectTeamActivity$1;

.field private final synthetic val$team:Lcom/blank/bm15/model/object/crud/Team;


# direct methods
.method constructor <init>(Lcom/blank/bm15/activity/SelectTeamActivity$1;Lcom/blank/bm15/model/object/crud/Team;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/blank/bm15/activity/SelectTeamActivity$1$1;->this$1:Lcom/blank/bm15/activity/SelectTeamActivity$1;

    iput-object p2, p0, Lcom/blank/bm15/activity/SelectTeamActivity$1$1;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "id"    # I

    .prologue
    .line 66
    iget-object v0, p0, Lcom/blank/bm15/activity/SelectTeamActivity$1$1;->this$1:Lcom/blank/bm15/activity/SelectTeamActivity$1;

    invoke-static {v0}, Lcom/blank/bm15/activity/SelectTeamActivity$1;->access$0(Lcom/blank/bm15/activity/SelectTeamActivity$1;)Lcom/blank/bm15/activity/SelectTeamActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/activity/SelectTeamActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v0

    iget-object v1, p0, Lcom/blank/bm15/activity/SelectTeamActivity$1$1;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Game;->setUserTeam(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 67
    iget-object v0, p0, Lcom/blank/bm15/activity/SelectTeamActivity$1$1;->this$1:Lcom/blank/bm15/activity/SelectTeamActivity$1;

    invoke-static {v0}, Lcom/blank/bm15/activity/SelectTeamActivity$1;->access$0(Lcom/blank/bm15/activity/SelectTeamActivity$1;)Lcom/blank/bm15/activity/SelectTeamActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/activity/SelectTeamActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 68
    iget-object v0, p0, Lcom/blank/bm15/activity/SelectTeamActivity$1$1;->this$1:Lcom/blank/bm15/activity/SelectTeamActivity$1;

    invoke-static {v0}, Lcom/blank/bm15/activity/SelectTeamActivity$1;->access$0(Lcom/blank/bm15/activity/SelectTeamActivity$1;)Lcom/blank/bm15/activity/SelectTeamActivity;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/blank/bm15/activity/SelectTeamActivity$1$1;->this$1:Lcom/blank/bm15/activity/SelectTeamActivity$1;

    invoke-static {v2}, Lcom/blank/bm15/activity/SelectTeamActivity$1;->access$0(Lcom/blank/bm15/activity/SelectTeamActivity$1;)Lcom/blank/bm15/activity/SelectTeamActivity;

    move-result-object v2

    const-class v3, Lcom/blank/bm15/activity/HomeActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Lcom/blank/bm15/activity/SelectTeamActivity;->startActivity(Landroid/content/Intent;)V

    .line 69
    return-void
.end method
