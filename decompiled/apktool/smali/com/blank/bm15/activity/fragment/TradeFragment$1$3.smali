.class Lcom/blank/bm15/activity/fragment/TradeFragment$1$3;
.super Ljava/lang/Object;
.source "TradeFragment.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blank/bm15/activity/fragment/TradeFragment$1;->onClick(Landroid/view/View;)V
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
.field final synthetic this$1:Lcom/blank/bm15/activity/fragment/TradeFragment$1;

.field private final synthetic val$listView:Landroid/widget/ListView;


# direct methods
.method constructor <init>(Lcom/blank/bm15/activity/fragment/TradeFragment$1;Landroid/widget/ListView;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$1$3;->this$1:Lcom/blank/bm15/activity/fragment/TradeFragment$1;

    iput-object p2, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$1$3;->val$listView:Landroid/widget/ListView;

    .line 167
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 4
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
    .line 171
    .local p1, "arg0":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$1$3;->val$listView:Landroid/widget/ListView;

    invoke-virtual {v1, p3}, Landroid/widget/ListView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/model/object/crud/Team;

    .line 172
    .local v0, "team":Lcom/blank/bm15/model/object/crud/Team;
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$1$3;->this$1:Lcom/blank/bm15/activity/fragment/TradeFragment$1;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/TradeFragment$1;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment$1;)Lcom/blank/bm15/activity/fragment/TradeFragment;

    move-result-object v1

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v1

    iget-object v2, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$1$3;->this$1:Lcom/blank/bm15/activity/fragment/TradeFragment$1;

    invoke-static {v2}, Lcom/blank/bm15/activity/fragment/TradeFragment$1;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment$1;)Lcom/blank/bm15/activity/fragment/TradeFragment;

    move-result-object v2

    iget-object v2, v2, Lcom/blank/bm15/activity/fragment/TradeFragment;->FILTER_SHARED_PREFERENCE:Ljava/lang/String;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-static {v1, v2, v3}, Lcom/blank/bm15/dao/utils/BlankSharedPreferences;->setInt(Landroid/content/Context;Ljava/lang/String;I)V

    .line 174
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$1$3;->this$1:Lcom/blank/bm15/activity/fragment/TradeFragment$1;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/TradeFragment$1;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment$1;)Lcom/blank/bm15/activity/fragment/TradeFragment;

    move-result-object v1

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$6(Lcom/blank/bm15/activity/fragment/TradeFragment;)V

    .line 175
    return-void
.end method
