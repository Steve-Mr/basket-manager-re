.class Lcom/blank/bm15/activity/fragment/TradeFragment$7;
.super Ljava/lang/Object;
.source "TradeFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blank/bm15/activity/fragment/TradeFragment;->openTradeDialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

.field private final synthetic val$teamId:I


# direct methods
.method constructor <init>(Lcom/blank/bm15/activity/fragment/TradeFragment;I)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$7;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    iput p2, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$7;->val$teamId:I

    .line 565
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

    .line 567
    invoke-interface {p1}, Landroid/content/DialogInterface;->cancel()V

    .line 569
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$7;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$10(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iget v1, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$7;->val$teamId:I

    if-ne v0, v1, :cond_1

    .line 570
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$7;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    invoke-static {v0, v2}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$3(Lcom/blank/bm15/activity/fragment/TradeFragment;Ljava/util/List;)V

    .line 572
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$7;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$11(Lcom/blank/bm15/activity/fragment/TradeFragment;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 573
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$7;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v0

    const v1, 0x7f050080

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/blank/bm15/model/util/Alert;->showErrorDialog(Landroid/app/Activity;Ljava/lang/Integer;)V

    .line 574
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$7;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    invoke-static {v0, v2}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$2(Lcom/blank/bm15/activity/fragment/TradeFragment;Lcom/blank/bm15/model/object/crud/Trade;)V

    .line 575
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$7;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    invoke-static {v0, v2}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$3(Lcom/blank/bm15/activity/fragment/TradeFragment;Ljava/util/List;)V

    .line 577
    invoke-interface {p1}, Landroid/content/DialogInterface;->cancel()V

    .line 584
    :goto_0
    return-void

    .line 579
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$7;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$12(Lcom/blank/bm15/activity/fragment/TradeFragment;)V

    goto :goto_0

    .line 582
    :cond_1
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$7;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$12(Lcom/blank/bm15/activity/fragment/TradeFragment;)V

    goto :goto_0
.end method
