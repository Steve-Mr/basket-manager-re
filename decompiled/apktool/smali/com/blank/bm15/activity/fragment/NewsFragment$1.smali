.class Lcom/blank/bm15/activity/fragment/NewsFragment$1;
.super Ljava/lang/Object;
.source "NewsFragment.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blank/bm15/activity/fragment/NewsFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
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
.field final synthetic this$0:Lcom/blank/bm15/activity/fragment/NewsFragment;

.field private final synthetic val$listView:Landroid/widget/ListView;


# direct methods
.method constructor <init>(Lcom/blank/bm15/activity/fragment/NewsFragment;Landroid/widget/ListView;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/blank/bm15/activity/fragment/NewsFragment$1;->this$0:Lcom/blank/bm15/activity/fragment/NewsFragment;

    iput-object p2, p0, Lcom/blank/bm15/activity/fragment/NewsFragment$1;->val$listView:Landroid/widget/ListView;

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 5
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
    .line 51
    .local p1, "arg0":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v2, p0, Lcom/blank/bm15/activity/fragment/NewsFragment$1;->val$listView:Landroid/widget/ListView;

    invoke-virtual {v2, p3}, Landroid/widget/ListView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/blank/bm15/model/object/crud/News;

    .line 52
    .local v1, "news":Lcom/blank/bm15/model/object/crud/News;
    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/News;->getTitle()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/blank/bm15/activity/fragment/NewsFragment$1;->this$0:Lcom/blank/bm15/activity/fragment/NewsFragment;

    invoke-virtual {v3}, Lcom/blank/bm15/activity/fragment/NewsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    const v4, 0x7f0500ee

    invoke-virtual {v3, v4}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 53
    new-instance v0, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    const-string v3, "http://reddit.com/r/basketmanager"

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 54
    .local v0, "browserIntent":Landroid/content/Intent;
    iget-object v2, p0, Lcom/blank/bm15/activity/fragment/NewsFragment$1;->this$0:Lcom/blank/bm15/activity/fragment/NewsFragment;

    invoke-virtual {v2, v0}, Lcom/blank/bm15/activity/fragment/NewsFragment;->startActivity(Landroid/content/Intent;)V

    .line 56
    .end local v0    # "browserIntent":Landroid/content/Intent;
    :cond_0
    return-void
.end method
