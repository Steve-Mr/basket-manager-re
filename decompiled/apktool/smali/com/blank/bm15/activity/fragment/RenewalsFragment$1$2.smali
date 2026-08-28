.class Lcom/blank/bm15/activity/fragment/RenewalsFragment$1$2;
.super Ljava/lang/Object;
.source "RenewalsFragment.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blank/bm15/activity/fragment/RenewalsFragment$1;->onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
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
.field final synthetic this$1:Lcom/blank/bm15/activity/fragment/RenewalsFragment$1;

.field private final synthetic val$listView:Landroid/widget/ListView;

.field private final synthetic val$player:Lcom/blank/bm15/model/object/crud/Player;


# direct methods
.method constructor <init>(Lcom/blank/bm15/activity/fragment/RenewalsFragment$1;Landroid/widget/ListView;Lcom/blank/bm15/model/object/crud/Player;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/blank/bm15/activity/fragment/RenewalsFragment$1$2;->this$1:Lcom/blank/bm15/activity/fragment/RenewalsFragment$1;

    iput-object p2, p0, Lcom/blank/bm15/activity/fragment/RenewalsFragment$1$2;->val$listView:Landroid/widget/ListView;

    iput-object p3, p0, Lcom/blank/bm15/activity/fragment/RenewalsFragment$1$2;->val$player:Lcom/blank/bm15/model/object/crud/Player;

    .line 104
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
    .local p1, "arg0":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    const/4 v1, 0x0

    .line 107
    iget-object v2, p0, Lcom/blank/bm15/activity/fragment/RenewalsFragment$1$2;->val$listView:Landroid/widget/ListView;

    invoke-virtual {v2, p3}, Landroid/widget/ListView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/model/object/crud/Offer;

    .line 108
    .local v0, "offer":Lcom/blank/bm15/model/object/crud/Offer;
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/16 v3, 0xa

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    iget-object v3, p0, Lcom/blank/bm15/activity/fragment/RenewalsFragment$1$2;->val$player:Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Player;->getLoyalty()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    add-int/2addr v3, p3

    if-ge v2, v3, :cond_0

    const/4 v1, 0x1

    :cond_0
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Offer;->setAnswer(Ljava/lang/Boolean;)V

    .line 109
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/RenewalsFragment$1$2;->this$1:Lcom/blank/bm15/activity/fragment/RenewalsFragment$1;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/RenewalsFragment$1;->access$0(Lcom/blank/bm15/activity/fragment/RenewalsFragment$1;)Lcom/blank/bm15/activity/fragment/RenewalsFragment;

    move-result-object v1

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/RenewalsFragment;->access$1(Lcom/blank/bm15/activity/fragment/RenewalsFragment;)Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Offer;->setMatchday(Ljava/lang/Integer;)V

    .line 110
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 111
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/RenewalsFragment$1$2;->this$1:Lcom/blank/bm15/activity/fragment/RenewalsFragment$1;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/RenewalsFragment$1;->access$0(Lcom/blank/bm15/activity/fragment/RenewalsFragment$1;)Lcom/blank/bm15/activity/fragment/RenewalsFragment;

    move-result-object v1

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/RenewalsFragment;->access$0(Lcom/blank/bm15/activity/fragment/RenewalsFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v1

    iget-object v1, v1, Lcom/blank/bm15/activity/HomeActivity;->alertDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->cancel()V

    .line 112
    return-void
.end method
