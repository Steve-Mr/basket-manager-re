.class Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment$1$3;
.super Ljava/lang/Object;
.source "Top100StatisticsFragment.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment$1;->onClick(Landroid/view/View;)V
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
.field final synthetic this$1:Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment$1;

.field private final synthetic val$listView:Landroid/widget/ListView;


# direct methods
.method constructor <init>(Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment$1;Landroid/widget/ListView;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment$1$3;->this$1:Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment$1;

    iput-object p2, p0, Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment$1$3;->val$listView:Landroid/widget/ListView;

    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 2
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
    .line 96
    .local p1, "arg0":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment$1$3;->this$1:Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment$1;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment$1;->access$0(Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment$1;)Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment;

    move-result-object v1

    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment$1$3;->val$listView:Landroid/widget/ListView;

    invoke-virtual {v0, p3}, Landroid/widget/ListView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment;->access$2(Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment;Ljava/lang/String;)V

    .line 97
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment$1$3;->this$1:Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment$1;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment$1;->access$0(Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment$1;)Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment;

    move-result-object v0

    add-int/lit8 v1, p3, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment;->access$1(Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment;Ljava/lang/Integer;)V

    .line 99
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment$1$3;->this$1:Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment$1;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment$1;->access$0(Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment$1;)Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment;->access$0(Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v0

    iget-object v0, v0, Lcom/blank/bm15/activity/HomeActivity;->alertDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->cancel()V

    .line 100
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment$1$3;->this$1:Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment$1;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment$1;->access$0(Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment$1;)Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment;->access$3(Lcom/blank/bm15/activity/fragment/Top100StatisticsFragment;)V

    .line 101
    return-void
.end method
