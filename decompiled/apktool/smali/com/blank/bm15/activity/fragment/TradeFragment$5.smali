.class Lcom/blank/bm15/activity/fragment/TradeFragment$5;
.super Ljava/lang/Object;
.source "TradeFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blank/bm15/activity/fragment/TradeFragment;->createPage()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;


# direct methods
.method constructor <init>(Lcom/blank/bm15/activity/fragment/TradeFragment;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$5;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    .line 499
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v4, 0x0

    .line 502
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$5;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$11(Lcom/blank/bm15/activity/fragment/TradeFragment;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 503
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$5;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v1

    iget-object v2, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$5;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    iget-object v2, v2, Lcom/blank/bm15/activity/fragment/TradeFragment;->FILTER_SHARED_PREFERENCE:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Lcom/blank/bm15/dao/utils/BlankSharedPreferences;->getInt(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v1}, Lcom/blank/bm15/dao/utils/BlankObj;->toInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 505
    .local v0, "teamId":I
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$5;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$10(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne v1, v0, :cond_0

    .line 506
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$5;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v1

    const v2, 0x7f050080

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/blank/bm15/model/util/Alert;->showErrorDialog(Landroid/app/Activity;Ljava/lang/Integer;)V

    .line 507
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$5;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    invoke-static {v1, v4}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$2(Lcom/blank/bm15/activity/fragment/TradeFragment;Lcom/blank/bm15/model/object/crud/Trade;)V

    .line 508
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$5;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    invoke-static {v1, v4}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$3(Lcom/blank/bm15/activity/fragment/TradeFragment;Ljava/util/List;)V

    .line 515
    .end local v0    # "teamId":I
    :goto_0
    return-void

    .line 510
    .restart local v0    # "teamId":I
    :cond_0
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$5;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v1

    const v2, 0x7f05007f

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/blank/bm15/model/util/Alert;->showErrorDialog(Landroid/app/Activity;Ljava/lang/Integer;)V

    goto :goto_0

    .line 513
    .end local v0    # "teamId":I
    :cond_1
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$5;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$12(Lcom/blank/bm15/activity/fragment/TradeFragment;)V

    goto :goto_0
.end method
