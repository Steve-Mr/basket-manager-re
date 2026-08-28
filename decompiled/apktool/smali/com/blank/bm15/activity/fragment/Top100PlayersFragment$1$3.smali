.class Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1$3;
.super Ljava/lang/Object;
.source "Top100PlayersFragment.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1;->onClick(Landroid/view/View;)V
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
.field final synthetic this$1:Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1;


# direct methods
.method constructor <init>(Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1$3;->this$1:Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1;

    .line 99
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 3
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
    .line 102
    .local p1, "arg0":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1$3;->this$1:Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1;->access$0(Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1;)Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;->access$0(Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v0

    const-string v1, "FILTER_PLAYERS"

    add-int/lit8 v2, p3, 0x1

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/dao/utils/BlankSharedPreferences;->setInt(Landroid/content/Context;Ljava/lang/String;I)V

    .line 104
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1$3;->this$1:Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1;->access$0(Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1;)Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;->access$0(Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v0

    iget-object v0, v0, Lcom/blank/bm15/activity/HomeActivity;->alertDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->cancel()V

    .line 105
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1$3;->this$1:Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1;->access$0(Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1;)Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;->access$1(Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;)V

    .line 106
    return-void
.end method
