.class Lcom/blank/bm15/activity/fragment/TradeFragment$1$1;
.super Ljava/lang/Object;
.source "TradeFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blank/bm15/activity/fragment/TradeFragment$1;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/blank/bm15/activity/fragment/TradeFragment$1;


# direct methods
.method constructor <init>(Lcom/blank/bm15/activity/fragment/TradeFragment$1;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$1$1;->this$1:Lcom/blank/bm15/activity/fragment/TradeFragment$1;

    .line 146
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "id"    # I

    .prologue
    const/4 v3, 0x0

    .line 148
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$1$1;->this$1:Lcom/blank/bm15/activity/fragment/TradeFragment$1;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment$1;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment$1;)Lcom/blank/bm15/activity/fragment/TradeFragment;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v0

    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$1$1;->this$1:Lcom/blank/bm15/activity/fragment/TradeFragment$1;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/TradeFragment$1;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment$1;)Lcom/blank/bm15/activity/fragment/TradeFragment;

    move-result-object v1

    iget-object v1, v1, Lcom/blank/bm15/activity/fragment/TradeFragment;->FILTER_SHARED_PREFERENCE:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/dao/utils/BlankSharedPreferences;->setInt(Landroid/content/Context;Ljava/lang/String;I)V

    .line 149
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$1$1;->this$1:Lcom/blank/bm15/activity/fragment/TradeFragment$1;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment$1;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment$1;)Lcom/blank/bm15/activity/fragment/TradeFragment;

    move-result-object v0

    invoke-static {v0, v3}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$1(Lcom/blank/bm15/activity/fragment/TradeFragment;Lcom/blank/bm15/model/object/crud/Trade;)V

    .line 150
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$1$1;->this$1:Lcom/blank/bm15/activity/fragment/TradeFragment$1;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment$1;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment$1;)Lcom/blank/bm15/activity/fragment/TradeFragment;

    move-result-object v0

    invoke-static {v0, v3}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$2(Lcom/blank/bm15/activity/fragment/TradeFragment;Lcom/blank/bm15/model/object/crud/Trade;)V

    .line 151
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$1$1;->this$1:Lcom/blank/bm15/activity/fragment/TradeFragment$1;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment$1;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment$1;)Lcom/blank/bm15/activity/fragment/TradeFragment;

    move-result-object v0

    invoke-static {v0, v3}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$3(Lcom/blank/bm15/activity/fragment/TradeFragment;Ljava/util/List;)V

    .line 152
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$1$1;->this$1:Lcom/blank/bm15/activity/fragment/TradeFragment$1;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment$1;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment$1;)Lcom/blank/bm15/activity/fragment/TradeFragment;

    move-result-object v0

    invoke-static {v0, v3}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$4(Lcom/blank/bm15/activity/fragment/TradeFragment;Landroid/widget/Button;)V

    .line 153
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$1$1;->this$1:Lcom/blank/bm15/activity/fragment/TradeFragment$1;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment$1;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment$1;)Lcom/blank/bm15/activity/fragment/TradeFragment;

    move-result-object v0

    invoke-static {v0, v3}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$5(Lcom/blank/bm15/activity/fragment/TradeFragment;Ljava/util/List;)V

    .line 155
    invoke-interface {p1}, Landroid/content/DialogInterface;->cancel()V

    .line 156
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$1$1;->this$1:Lcom/blank/bm15/activity/fragment/TradeFragment$1;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment$1;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment$1;)Lcom/blank/bm15/activity/fragment/TradeFragment;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$6(Lcom/blank/bm15/activity/fragment/TradeFragment;)V

    .line 157
    return-void
.end method
