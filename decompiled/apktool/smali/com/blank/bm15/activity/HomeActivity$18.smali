.class Lcom/blank/bm15/activity/HomeActivity$18;
.super Ljava/lang/Object;
.source "HomeActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blank/bm15/activity/HomeActivity;->validateLineup(I)Ljava/lang/Boolean;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/blank/bm15/activity/HomeActivity;


# direct methods
.method constructor <init>(Lcom/blank/bm15/activity/HomeActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/blank/bm15/activity/HomeActivity$18;->this$0:Lcom/blank/bm15/activity/HomeActivity;

    .line 553
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "id"    # I

    .prologue
    .line 555
    iget-object v0, p0, Lcom/blank/bm15/activity/HomeActivity$18;->this$0:Lcom/blank/bm15/activity/HomeActivity;

    const/16 v1, 0xa

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget-object v2, p0, Lcom/blank/bm15/activity/HomeActivity$18;->this$0:Lcom/blank/bm15/activity/HomeActivity;

    invoke-virtual {v2}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/base/BaseActivity;->addNavigation(Landroid/content/Context;Ljava/lang/Integer;Ljava/lang/Integer;)V

    .line 556
    iget-object v0, p0, Lcom/blank/bm15/activity/HomeActivity$18;->this$0:Lcom/blank/bm15/activity/HomeActivity;

    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/blank/bm15/activity/HomeActivity$18;->this$0:Lcom/blank/bm15/activity/HomeActivity;

    const-class v3, Lcom/blank/bm15/activity/HomeActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Lcom/blank/bm15/activity/HomeActivity;->startActivity(Landroid/content/Intent;)V

    .line 557
    return-void
.end method
