.class Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1$1;
.super Ljava/lang/Object;
.source "Top100PlayersFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1;


# direct methods
.method constructor <init>(Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1$1;->this$1:Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1;

    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "id"    # I

    .prologue
    .line 79
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1$1;->this$1:Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1;->access$0(Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1;)Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;->access$0(Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v0

    const-string v1, "FILTER_PLAYERS"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/dao/utils/BlankSharedPreferences;->setInt(Landroid/content/Context;Ljava/lang/String;I)V

    .line 80
    invoke-interface {p1}, Landroid/content/DialogInterface;->cancel()V

    .line 81
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1$1;->this$1:Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1;->access$0(Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1;)Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;->access$1(Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;)V

    .line 82
    return-void
.end method
