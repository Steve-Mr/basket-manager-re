.class Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment$1$1;
.super Ljava/lang/Object;
.source "Top100StatisticsFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment$1;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment$1;


# direct methods
.method constructor <init>(Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment$1;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment$1$1;->this$1:Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment$1;

    .line 70
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

    .line 72
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment$1$1;->this$1:Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment$1;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment$1;->access$0(Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment$1;)Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment;

    move-result-object v0

    invoke-static {v0, v1}, Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment;->access$1(Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment;Ljava/lang/Integer;)V

    .line 73
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment$1$1;->this$1:Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment$1;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment$1;->access$0(Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment$1;)Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment;

    move-result-object v0

    invoke-static {v0, v1}, Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment;->access$2(Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment;Ljava/lang/String;)V

    .line 74
    invoke-interface {p1}, Landroid/content/DialogInterface;->cancel()V

    .line 75
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment$1$1;->this$1:Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment$1;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment$1;->access$0(Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment$1;)Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment;->access$3(Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment;)V

    .line 76
    return-void
.end method
