.class Lcom/blank/bm15/activity/fragment/TradeFragment$6;
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
    iput-object p1, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$6;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    iput p2, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$6;->val$teamId:I

    .line 539
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "id"    # I

    .prologue
    .line 542
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$6;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$10(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iget v1, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$6;->val$teamId:I

    if-ne v0, v1, :cond_0

    .line 543
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$6;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$8(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v0

    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$6;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$13(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundA1()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Trade;->setDraftRoundB1(Lcom/blank/bm15/model/object/crud/DraftRound;)V

    .line 544
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$6;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$8(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v0

    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$6;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$13(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundA2()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Trade;->setDraftRoundB2(Lcom/blank/bm15/model/object/crud/DraftRound;)V

    .line 545
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$6;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$8(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v0

    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$6;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$13(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundA3()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Trade;->setDraftRoundB3(Lcom/blank/bm15/model/object/crud/DraftRound;)V

    .line 547
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$6;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$8(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v0

    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$6;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$13(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerA1()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Trade;->setPlayerB1(Lcom/blank/bm15/model/object/crud/Player;)V

    .line 548
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$6;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$8(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v0

    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$6;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$13(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerA2()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Trade;->setPlayerB2(Lcom/blank/bm15/model/object/crud/Player;)V

    .line 549
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$6;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$8(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v0

    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$6;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$13(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerA3()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Trade;->setPlayerB3(Lcom/blank/bm15/model/object/crud/Player;)V

    .line 559
    :goto_0
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$6;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$6;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$8(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$14(Lcom/blank/bm15/activity/fragment/TradeFragment;Lcom/blank/bm15/model/object/crud/Trade;)V

    .line 561
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$6;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v0

    iget-object v0, v0, Lcom/blank/bm15/activity/HomeActivity;->alertDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->cancel()V

    .line 562
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$6;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$6(Lcom/blank/bm15/activity/fragment/TradeFragment;)V

    .line 563
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$6;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v0

    const v1, 0x7f050069

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/blank/bm15/model/util/Alert;->showNoticeDialog(Landroid/app/Activity;Ljava/lang/Integer;)V

    .line 564
    return-void

    .line 551
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$6;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$8(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v0

    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$6;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$13(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundA1()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Trade;->setDraftRoundA1(Lcom/blank/bm15/model/object/crud/DraftRound;)V

    .line 552
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$6;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$8(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v0

    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$6;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$13(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundA2()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Trade;->setDraftRoundA2(Lcom/blank/bm15/model/object/crud/DraftRound;)V

    .line 553
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$6;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$8(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v0

    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$6;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$13(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundA3()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Trade;->setDraftRoundA3(Lcom/blank/bm15/model/object/crud/DraftRound;)V

    .line 555
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$6;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$8(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v0

    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$6;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$13(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerA1()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Trade;->setPlayerA1(Lcom/blank/bm15/model/object/crud/Player;)V

    .line 556
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$6;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$8(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v0

    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$6;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$13(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerA2()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Trade;->setPlayerA2(Lcom/blank/bm15/model/object/crud/Player;)V

    .line 557
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$6;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$8(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v0

    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$6;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$13(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerA3()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Trade;->setPlayerA3(Lcom/blank/bm15/model/object/crud/Player;)V

    goto/16 :goto_0
.end method
