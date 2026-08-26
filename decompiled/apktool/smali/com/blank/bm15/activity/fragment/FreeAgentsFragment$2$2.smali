.class Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2$2;
.super Ljava/lang/Object;
.source "FreeAgentsFragment.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;->onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
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
.field final synthetic this$1:Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;

.field private final synthetic val$listView:Landroid/widget/ListView;

.field private final synthetic val$player:Lcom/blank/bm15/model/object/crud/Player;

.field private final synthetic val$playerList:Ljava/util/List;

.field private final synthetic val$salaryAvailable:Ljava/lang/Integer;


# direct methods
.method constructor <init>(Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;Landroid/widget/ListView;Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Player;Ljava/util/List;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2$2;->this$1:Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;

    iput-object p2, p0, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2$2;->val$listView:Landroid/widget/ListView;

    iput-object p3, p0, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2$2;->val$salaryAvailable:Ljava/lang/Integer;

    iput-object p4, p0, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2$2;->val$player:Lcom/blank/bm15/model/object/crud/Player;

    iput-object p5, p0, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2$2;->val$playerList:Ljava/util/List;

    .line 177
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 6
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
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 180
    iget-object v3, p0, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2$2;->val$listView:Landroid/widget/ListView;

    invoke-virtual {v3, p3}, Landroid/widget/ListView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/model/object/crud/Offer;

    .line 182
    .local v0, "offer":Lcom/blank/bm15/model/object/crud/Offer;
    iget-object v3, p0, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2$2;->val$salaryAvailable:Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Offer;->getSalary()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-gt v3, v4, :cond_0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Offer;->getSalary()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const v4, 0xf4240

    if-ge v3, v4, :cond_1

    .line 184
    :cond_0
    iget-object v3, p0, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2$2;->this$1:Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;

    invoke-static {v3}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;->access$0(Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;)Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;

    move-result-object v3

    invoke-static {v3}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->access$2(Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;)Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/16 v4, 0xea

    if-ne v3, v4, :cond_3

    .line 185
    iget-object v3, p0, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2$2;->val$player:Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Player;->getOfferList()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 187
    iget-object v3, p0, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2$2;->this$1:Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;

    invoke-static {v3}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;->access$0(Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;)Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;

    move-result-object v3

    invoke-static {v3}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->access$2(Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;)Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v3

    iget-object v4, p0, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2$2;->val$playerList:Ljava/util/List;

    invoke-static {v3, v4}, Lcom/blank/bm15/model/core/ManageFreeAgency;->manageLastMathcdayOffers(Lcom/blank/bm15/model/object/crud/Game;Ljava/util/List;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 188
    iget-object v3, p0, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2$2;->this$1:Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;

    invoke-static {v3}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;->access$0(Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;)Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;

    move-result-object v3

    invoke-static {v3}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->access$0(Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v3

    iget-object v4, p0, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2$2;->this$1:Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;

    invoke-static {v4}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;->access$0(Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;)Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;

    move-result-object v4

    invoke-static {v4}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->access$0(Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v4

    const v5, 0x7f050066

    invoke-virtual {v4, v5}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v5, p0, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2$2;->val$player:Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getShortName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v2, v1

    invoke-static {v4, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v1}, Lcom/blank/bm15/model/util/Alert;->showWarningDialog(Landroid/app/Activity;Ljava/lang/String;)V

    .line 192
    :goto_0
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2$2;->this$1:Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;->access$0(Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;)Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;

    move-result-object v1

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->access$1(Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;)V

    .line 197
    :goto_1
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 198
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2$2;->this$1:Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;->access$0(Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;)Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;

    move-result-object v1

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->access$0(Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v1

    iget-object v1, v1, Lcom/blank/bm15/activity/HomeActivity;->alertDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->cancel()V

    .line 200
    :cond_1
    return-void

    .line 190
    :cond_2
    iget-object v3, p0, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2$2;->this$1:Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;

    invoke-static {v3}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;->access$0(Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;)Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;

    move-result-object v3

    invoke-static {v3}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->access$0(Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v3

    iget-object v4, p0, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2$2;->this$1:Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;

    invoke-static {v4}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;->access$0(Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;)Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;

    move-result-object v4

    invoke-static {v4}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->access$0(Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v4

    const v5, 0x7f050067

    invoke-virtual {v4, v5}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v5, p0, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2$2;->val$player:Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getShortName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v2, v1

    invoke-static {v4, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v1}, Lcom/blank/bm15/model/util/Alert;->showWarningDialog(Landroid/app/Activity;Ljava/lang/String;)V

    goto :goto_0

    .line 194
    :cond_3
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x5

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-ge v3, p3, :cond_4

    move v1, v2

    :cond_4
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Offer;->setAnswer(Ljava/lang/Boolean;)V

    .line 195
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2$2;->this$1:Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;->access$0(Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;)Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;

    move-result-object v1

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->access$2(Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;)Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    add-int/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/object/crud/Offer;->setMatchday(Ljava/lang/Integer;)V

    goto/16 :goto_1
.end method
