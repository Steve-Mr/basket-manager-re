.class Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$1$1;
.super Ljava/lang/Object;
.source "FreeAgentsFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$1;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$1;


# direct methods
.method constructor <init>(Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$1;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$1$1;->this$1:Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$1;

    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "id"    # I

    .prologue
    .line 82
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$1$1;->this$1:Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$1;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$1;->access$0(Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$1;)Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->access$0(Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v0

    const-string v1, "FILTER_FREE_AGENTS"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/dao/utils/BlankSharedPreferences;->setInt(Landroid/content/Context;Ljava/lang/String;I)V

    .line 83
    invoke-interface {p1}, Landroid/content/DialogInterface;->cancel()V

    .line 84
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$1$1;->this$1:Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$1;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$1;->access$0(Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$1;)Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->access$1(Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;)V

    .line 85
    return-void
.end method
