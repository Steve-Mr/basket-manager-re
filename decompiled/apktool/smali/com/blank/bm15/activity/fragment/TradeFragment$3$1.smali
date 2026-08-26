.class Lcom/blank/bm15/activity/fragment/TradeFragment$3$1;
.super Ljava/lang/Object;
.source "TradeFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blank/bm15/activity/fragment/TradeFragment$3;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/blank/bm15/activity/fragment/TradeFragment$3;

.field private final synthetic val$elementButton2:Landroid/widget/Button;

.field private final synthetic val$findButton:Landroid/widget/Button;


# direct methods
.method constructor <init>(Lcom/blank/bm15/activity/fragment/TradeFragment$3;Landroid/widget/Button;Landroid/widget/Button;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$3$1;->this$1:Lcom/blank/bm15/activity/fragment/TradeFragment$3;

    iput-object p2, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$3$1;->val$elementButton2:Landroid/widget/Button;

    iput-object p3, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$3$1;->val$findButton:Landroid/widget/Button;

    .line 299
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "id"    # I

    .prologue
    const/4 v1, 0x0

    .line 301
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$3$1;->this$1:Lcom/blank/bm15/activity/fragment/TradeFragment$3;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment$3;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment$3;)Lcom/blank/bm15/activity/fragment/TradeFragment;

    move-result-object v0

    invoke-static {v0, v1}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$2(Lcom/blank/bm15/activity/fragment/TradeFragment;Lcom/blank/bm15/model/object/crud/Trade;)V

    .line 302
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$3$1;->this$1:Lcom/blank/bm15/activity/fragment/TradeFragment$3;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment$3;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment$3;)Lcom/blank/bm15/activity/fragment/TradeFragment;

    move-result-object v0

    invoke-static {v0, v1}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$3(Lcom/blank/bm15/activity/fragment/TradeFragment;Ljava/util/List;)V

    .line 304
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$3$1;->this$1:Lcom/blank/bm15/activity/fragment/TradeFragment$3;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment$3;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment$3;)Lcom/blank/bm15/activity/fragment/TradeFragment;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$8(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Trade;->setPlayerA2(Lcom/blank/bm15/model/object/crud/Player;)V

    .line 305
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$3$1;->this$1:Lcom/blank/bm15/activity/fragment/TradeFragment$3;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment$3;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment$3;)Lcom/blank/bm15/activity/fragment/TradeFragment;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$8(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Trade;->setPlayerB2(Lcom/blank/bm15/model/object/crud/Player;)V

    .line 307
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$3$1;->this$1:Lcom/blank/bm15/activity/fragment/TradeFragment$3;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment$3;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment$3;)Lcom/blank/bm15/activity/fragment/TradeFragment;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$8(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Trade;->setDraftRoundA2(Lcom/blank/bm15/model/object/crud/DraftRound;)V

    .line 308
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$3$1;->this$1:Lcom/blank/bm15/activity/fragment/TradeFragment$3;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment$3;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment$3;)Lcom/blank/bm15/activity/fragment/TradeFragment;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$8(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Trade;->setDraftRoundB2(Lcom/blank/bm15/model/object/crud/DraftRound;)V

    .line 310
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$3$1;->val$elementButton2:Landroid/widget/Button;

    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$3$1;->this$1:Lcom/blank/bm15/activity/fragment/TradeFragment$3;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/TradeFragment$3;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment$3;)Lcom/blank/bm15/activity/fragment/TradeFragment;

    move-result-object v1

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v1

    const v2, 0x7f05017f

    invoke-virtual {v1, v2}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 312
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$3$1;->this$1:Lcom/blank/bm15/activity/fragment/TradeFragment$3;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment$3;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment$3;)Lcom/blank/bm15/activity/fragment/TradeFragment;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$8(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerA1()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v0

    if-nez v0, :cond_0

    .line 313
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$3$1;->this$1:Lcom/blank/bm15/activity/fragment/TradeFragment$3;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment$3;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment$3;)Lcom/blank/bm15/activity/fragment/TradeFragment;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$8(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerB1()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v0

    if-nez v0, :cond_0

    .line 314
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$3$1;->this$1:Lcom/blank/bm15/activity/fragment/TradeFragment$3;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment$3;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment$3;)Lcom/blank/bm15/activity/fragment/TradeFragment;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$8(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerA3()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v0

    if-nez v0, :cond_0

    .line 315
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$3$1;->this$1:Lcom/blank/bm15/activity/fragment/TradeFragment$3;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment$3;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment$3;)Lcom/blank/bm15/activity/fragment/TradeFragment;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$8(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Trade;->getPlayerB3()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v0

    if-nez v0, :cond_0

    .line 316
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$3$1;->this$1:Lcom/blank/bm15/activity/fragment/TradeFragment$3;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment$3;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment$3;)Lcom/blank/bm15/activity/fragment/TradeFragment;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$8(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundA1()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/DraftRound;->getId()Ljava/lang/Integer;

    move-result-object v0

    if-nez v0, :cond_0

    .line 317
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$3$1;->this$1:Lcom/blank/bm15/activity/fragment/TradeFragment$3;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment$3;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment$3;)Lcom/blank/bm15/activity/fragment/TradeFragment;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$8(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundB1()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/DraftRound;->getId()Ljava/lang/Integer;

    move-result-object v0

    if-nez v0, :cond_0

    .line 318
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$3$1;->this$1:Lcom/blank/bm15/activity/fragment/TradeFragment$3;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment$3;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment$3;)Lcom/blank/bm15/activity/fragment/TradeFragment;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$8(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundA3()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/DraftRound;->getId()Ljava/lang/Integer;

    move-result-object v0

    if-nez v0, :cond_0

    .line 319
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$3$1;->this$1:Lcom/blank/bm15/activity/fragment/TradeFragment$3;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment$3;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment$3;)Lcom/blank/bm15/activity/fragment/TradeFragment;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$8(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Trade;->getDraftRoundB3()Lcom/blank/bm15/model/object/crud/DraftRound;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/DraftRound;->getId()Ljava/lang/Integer;

    move-result-object v0

    if-nez v0, :cond_0

    .line 321
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$3$1;->val$findButton:Landroid/widget/Button;

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 322
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$3$1;->val$findButton:Landroid/widget/Button;

    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$3$1;->this$1:Lcom/blank/bm15/activity/fragment/TradeFragment$3;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/TradeFragment$3;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment$3;)Lcom/blank/bm15/activity/fragment/TradeFragment;

    move-result-object v1

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f060026

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 325
    :cond_0
    invoke-interface {p1}, Landroid/content/DialogInterface;->cancel()V

    .line 326
    return-void
.end method
