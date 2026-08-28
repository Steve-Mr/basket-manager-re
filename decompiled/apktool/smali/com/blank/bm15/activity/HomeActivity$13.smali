.class Lcom/blank/bm15/activity/HomeActivity$13;
.super Ljava/lang/Object;
.source "HomeActivity.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blank/bm15/activity/HomeActivity;->loadDrawer()V
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
.field final synthetic this$0:Lcom/blank/bm15/activity/HomeActivity;


# direct methods
.method constructor <init>(Lcom/blank/bm15/activity/HomeActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/blank/bm15/activity/HomeActivity$13;->this$0:Lcom/blank/bm15/activity/HomeActivity;

    .line 318
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 9
    .param p2, "view"    # Landroid/view/View;
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
    const v7, 0x7f050075

    const/16 v6, 0x58

    .line 321
    iget-object v4, p0, Lcom/blank/bm15/activity/HomeActivity$13;->this$0:Lcom/blank/bm15/activity/HomeActivity;

    invoke-static {v4}, Lcom/blank/bm15/activity/HomeActivity;->access$3(Lcom/blank/bm15/activity/HomeActivity;)Landroid/widget/ListView;

    move-result-object v4

    invoke-virtual {v4, p3}, Landroid/widget/ListView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/blank/bm15/model/object/other/DrawerItem;

    .line 322
    .local v3, "item":Lcom/blank/bm15/model/object/other/DrawerItem;
    iget-object v4, p0, Lcom/blank/bm15/activity/HomeActivity$13;->this$0:Lcom/blank/bm15/activity/HomeActivity;

    invoke-static {v4}, Lcom/blank/bm15/activity/HomeActivity;->access$4(Lcom/blank/bm15/activity/HomeActivity;)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-nez v4, :cond_0

    .line 323
    iget-object v4, p0, Lcom/blank/bm15/activity/HomeActivity$13;->this$0:Lcom/blank/bm15/activity/HomeActivity;

    invoke-static {v4}, Lcom/blank/bm15/activity/HomeActivity;->access$5(Lcom/blank/bm15/activity/HomeActivity;)Landroid/support/v4/widget/DrawerLayout;

    move-result-object v4

    iget-object v5, p0, Lcom/blank/bm15/activity/HomeActivity$13;->this$0:Lcom/blank/bm15/activity/HomeActivity;

    invoke-static {v5}, Lcom/blank/bm15/activity/HomeActivity;->access$3(Lcom/blank/bm15/activity/HomeActivity;)Landroid/widget/ListView;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/support/v4/widget/DrawerLayout;->closeDrawer(Landroid/view/View;)V

    .line 326
    :cond_0
    invoke-virtual {v3}, Lcom/blank/bm15/model/object/other/DrawerItem;->getId()Ljava/lang/Integer;

    move-result-object v0

    .line 327
    .local v0, "idFragment":Ljava/lang/Integer;
    const/4 v1, 0x0

    .line 328
    .local v1, "idObject":Ljava/lang/Integer;
    const/16 v4, 0xa

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/other/DrawerItem;->getId()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-ne v4, v5, :cond_3

    .line 329
    iget-object v4, p0, Lcom/blank/bm15/activity/HomeActivity$13;->this$0:Lcom/blank/bm15/activity/HomeActivity;

    invoke-virtual {v4}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v1

    .line 369
    :cond_1
    :goto_0
    iget-object v4, p0, Lcom/blank/bm15/activity/HomeActivity$13;->this$0:Lcom/blank/bm15/activity/HomeActivity;

    invoke-static {v4, v0, v1}, Lcom/blank/bm15/activity/base/BaseActivity;->addNavigation(Landroid/content/Context;Ljava/lang/Integer;Ljava/lang/Integer;)V

    .line 370
    iget-object v4, p0, Lcom/blank/bm15/activity/HomeActivity$13;->this$0:Lcom/blank/bm15/activity/HomeActivity;

    invoke-static {v4}, Lcom/blank/bm15/activity/HomeActivity;->access$0(Lcom/blank/bm15/activity/HomeActivity;)V

    .line 371
    :cond_2
    :goto_1
    return-void

    .line 330
    :cond_3
    const/4 v4, 0x4

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/other/DrawerItem;->getId()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-ne v4, v5, :cond_4

    iget-object v4, p0, Lcom/blank/bm15/activity/HomeActivity$13;->this$0:Lcom/blank/bm15/activity/HomeActivity;

    invoke-static {v4}, Lcom/blank/bm15/activity/HomeActivity;->access$6(Lcom/blank/bm15/activity/HomeActivity;)Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v4

    if-eqz v4, :cond_4

    .line 331
    iget-object v4, p0, Lcom/blank/bm15/activity/HomeActivity$13;->this$0:Lcom/blank/bm15/activity/HomeActivity;

    invoke-static {v4}, Lcom/blank/bm15/activity/HomeActivity;->access$6(Lcom/blank/bm15/activity/HomeActivity;)Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v1

    .line 332
    goto :goto_0

    :cond_4
    const/4 v4, 0x1

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/other/DrawerItem;->getId()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-ne v4, v5, :cond_5

    .line 333
    iget-object v4, p0, Lcom/blank/bm15/activity/HomeActivity$13;->this$0:Lcom/blank/bm15/activity/HomeActivity;

    invoke-static {v4}, Lcom/blank/bm15/activity/HomeActivity;->access$7(Lcom/blank/bm15/activity/HomeActivity;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 334
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    iget-object v6, p0, Lcom/blank/bm15/activity/HomeActivity$13;->this$0:Lcom/blank/bm15/activity/HomeActivity;

    invoke-static {v6}, Lcom/blank/bm15/activity/HomeActivity;->access$8(Lcom/blank/bm15/activity/HomeActivity;)J

    move-result-wide v6

    sub-long/2addr v4, v6

    const-wide/16 v6, 0xbb8

    cmp-long v4, v4, v6

    if-ltz v4, :cond_2

    .line 337
    iget-object v4, p0, Lcom/blank/bm15/activity/HomeActivity$13;->this$0:Lcom/blank/bm15/activity/HomeActivity;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    invoke-static {v4, v6, v7}, Lcom/blank/bm15/activity/HomeActivity;->access$9(Lcom/blank/bm15/activity/HomeActivity;J)V

    .line 339
    iget-object v4, p0, Lcom/blank/bm15/activity/HomeActivity$13;->this$0:Lcom/blank/bm15/activity/HomeActivity;

    new-instance v5, Lcom/blank/bm15/model/core/Play;

    iget-object v6, p0, Lcom/blank/bm15/activity/HomeActivity$13;->this$0:Lcom/blank/bm15/activity/HomeActivity;

    invoke-virtual {v6}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/blank/bm15/model/core/Play;-><init>(Lcom/blank/bm15/model/object/crud/Game;)V

    invoke-static {v4, v5}, Lcom/blank/bm15/activity/HomeActivity;->access$1(Lcom/blank/bm15/activity/HomeActivity;Lcom/blank/bm15/model/core/Play;)V

    .line 340
    iget-object v4, p0, Lcom/blank/bm15/activity/HomeActivity$13;->this$0:Lcom/blank/bm15/activity/HomeActivity;

    invoke-static {v4}, Lcom/blank/bm15/activity/HomeActivity;->access$2(Lcom/blank/bm15/activity/HomeActivity;)Lcom/blank/bm15/model/core/Play;

    move-result-object v4

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Void;

    invoke-virtual {v4, v5}, Lcom/blank/bm15/model/core/Play;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_1

    .line 343
    :cond_5
    const/4 v4, 0x2

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/other/DrawerItem;->getId()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-ne v4, v5, :cond_6

    .line 344
    iget-object v4, p0, Lcom/blank/bm15/activity/HomeActivity$13;->this$0:Lcom/blank/bm15/activity/HomeActivity;

    iget-object v5, p0, Lcom/blank/bm15/activity/HomeActivity$13;->this$0:Lcom/blank/bm15/activity/HomeActivity;

    invoke-virtual {v5}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    add-int/lit8 v5, v5, 0x7

    invoke-virtual {v4, v5}, Lcom/blank/bm15/activity/HomeActivity;->play(I)V

    goto/16 :goto_1

    .line 346
    :cond_6
    const/4 v4, 0x3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/other/DrawerItem;->getId()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-ne v4, v5, :cond_7

    .line 347
    iget-object v4, p0, Lcom/blank/bm15/activity/HomeActivity$13;->this$0:Lcom/blank/bm15/activity/HomeActivity;

    iget-object v5, p0, Lcom/blank/bm15/activity/HomeActivity$13;->this$0:Lcom/blank/bm15/activity/HomeActivity;

    invoke-virtual {v5}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    add-int/lit8 v5, v5, 0x1e

    invoke-virtual {v4, v5}, Lcom/blank/bm15/activity/HomeActivity;->play(I)V

    goto/16 :goto_1

    .line 349
    :cond_7
    const/16 v4, 0x16

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/other/DrawerItem;->getId()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-ne v4, v5, :cond_8

    .line 350
    iget-object v4, p0, Lcom/blank/bm15/activity/HomeActivity$13;->this$0:Lcom/blank/bm15/activity/HomeActivity;

    invoke-virtual {v4}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-lt v4, v6, :cond_1

    iget-object v4, p0, Lcom/blank/bm15/activity/HomeActivity$13;->this$0:Lcom/blank/bm15/activity/HomeActivity;

    invoke-virtual {v4}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const/16 v5, 0xe7

    if-eq v4, v5, :cond_1

    .line 351
    iget-object v4, p0, Lcom/blank/bm15/activity/HomeActivity$13;->this$0:Lcom/blank/bm15/activity/HomeActivity;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/blank/bm15/model/util/Alert;->showWarningDialog(Landroid/app/Activity;Ljava/lang/Integer;)V

    goto/16 :goto_1

    .line 354
    :cond_8
    const/16 v4, 0x17

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/other/DrawerItem;->getId()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-ne v4, v5, :cond_9

    .line 355
    iget-object v4, p0, Lcom/blank/bm15/activity/HomeActivity$13;->this$0:Lcom/blank/bm15/activity/HomeActivity;

    invoke-virtual {v4}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-lt v4, v6, :cond_1

    iget-object v4, p0, Lcom/blank/bm15/activity/HomeActivity$13;->this$0:Lcom/blank/bm15/activity/HomeActivity;

    invoke-virtual {v4}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const/16 v5, 0xea

    if-ge v4, v5, :cond_1

    .line 356
    iget-object v4, p0, Lcom/blank/bm15/activity/HomeActivity$13;->this$0:Lcom/blank/bm15/activity/HomeActivity;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/blank/bm15/model/util/Alert;->showWarningDialog(Landroid/app/Activity;Ljava/lang/Integer;)V

    goto/16 :goto_1

    .line 359
    :cond_9
    const/16 v4, 0x28

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/other/DrawerItem;->getId()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-ne v4, v5, :cond_a

    .line 360
    new-instance v2, Landroid/content/Intent;

    iget-object v4, p0, Lcom/blank/bm15/activity/HomeActivity$13;->this$0:Lcom/blank/bm15/activity/HomeActivity;

    const-class v5, Lcom/blank/bm15/activity/MainActivity;

    invoke-direct {v2, v4, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 361
    .local v2, "intent":Landroid/content/Intent;
    const v4, 0x10008000

    invoke-virtual {v2, v4}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 362
    iget-object v4, p0, Lcom/blank/bm15/activity/HomeActivity$13;->this$0:Lcom/blank/bm15/activity/HomeActivity;

    invoke-virtual {v4, v2}, Lcom/blank/bm15/activity/HomeActivity;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_1

    .line 364
    .end local v2    # "intent":Landroid/content/Intent;
    :cond_a
    const/16 v4, 0x2a

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/other/DrawerItem;->getId()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-ne v4, v5, :cond_1

    .line 365
    iget-object v4, p0, Lcom/blank/bm15/activity/HomeActivity$13;->this$0:Lcom/blank/bm15/activity/HomeActivity;

    new-instance v5, Landroid/content/Intent;

    const-string v6, "android.intent.action.VIEW"

    iget-object v7, p0, Lcom/blank/bm15/activity/HomeActivity$13;->this$0:Lcom/blank/bm15/activity/HomeActivity;

    invoke-virtual {v7}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f0500b0

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v4, v5}, Lcom/blank/bm15/activity/HomeActivity;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_1
.end method
