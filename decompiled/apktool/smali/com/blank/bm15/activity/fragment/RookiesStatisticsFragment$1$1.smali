.class Lcom/blank/bm15/activity/fragment/RookiesStatisticsFragment$1$1;
.super Ljava/lang/Object;
.source "RookiesStatisticsFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blank/bm15/activity/fragment/RookiesStatisticsFragment$1;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/blank/bm15/activity/fragment/RookiesStatisticsFragment$1;


# direct methods
.method constructor <init>(Lcom/blank/bm15/activity/fragment/RookiesStatisticsFragment$1;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/blank/bm15/activity/fragment/RookiesStatisticsFragment$1$1;->this$1:Lcom/blank/bm15/activity/fragment/RookiesStatisticsFragment$1;

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "id"    # I

    .prologue
    const/4 v1, 0x0

    .line 71
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/RookiesStatisticsFragment$1$1;->this$1:Lcom/blank/bm15/activity/fragment/RookiesStatisticsFragment$1;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/RookiesStatisticsFragment$1;->access$0(Lcom/blank/bm15/activity/fragment/RookiesStatisticsFragment$1;)Lcom/blank/bm15/activity/fragment/RookiesStatisticsFragment;

    move-result-object v0

    invoke-static {v0, v1}, Lcom/blank/bm15/activity/fragment/RookiesStatisticsFragment;->access$1(Lcom/blank/bm15/activity/fragment/RookiesStatisticsFragment;Ljava/lang/Integer;)V

    .line 72
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/RookiesStatisticsFragment$1$1;->this$1:Lcom/blank/bm15/activity/fragment/RookiesStatisticsFragment$1;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/RookiesStatisticsFragment$1;->access$0(Lcom/blank/bm15/activity/fragment/RookiesStatisticsFragment$1;)Lcom/blank/bm15/activity/fragment/RookiesStatisticsFragment;

    move-result-object v0

    invoke-static {v0, v1}, Lcom/blank/bm15/activity/fragment/RookiesStatisticsFragment;->access$2(Lcom/blank/bm15/activity/fragment/RookiesStatisticsFragment;Ljava/lang/String;)V

    .line 73
    invoke-interface {p1}, Landroid/content/DialogInterface;->cancel()V

    .line 74
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/RookiesStatisticsFragment$1$1;->this$1:Lcom/blank/bm15/activity/fragment/RookiesStatisticsFragment$1;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/RookiesStatisticsFragment$1;->access$0(Lcom/blank/bm15/activity/fragment/RookiesStatisticsFragment$1;)Lcom/blank/bm15/activity/fragment/RookiesStatisticsFragment;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/RookiesStatisticsFragment;->access$3(Lcom/blank/bm15/activity/fragment/RookiesStatisticsFragment;)V

    .line 75
    return-void
.end method
