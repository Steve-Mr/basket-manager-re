.class Lcom/blank/bm15/activity/fragment/TradeFragment$2$3;
.super Ljava/lang/Object;
.source "TradeFragment.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blank/bm15/activity/fragment/TradeFragment$2;->onClick(Landroid/view/View;)V
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
.field final synthetic this$1:Lcom/blank/bm15/activity/fragment/TradeFragment$2;

.field private final synthetic val$elementButton1:Landroid/widget/Button;

.field private final synthetic val$findButton:Landroid/widget/Button;

.field private final synthetic val$listView:Landroid/widget/ListView;


# direct methods
.method constructor <init>(Lcom/blank/bm15/activity/fragment/TradeFragment$2;Landroid/widget/ListView;Landroid/widget/Button;Landroid/widget/Button;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$2$3;->this$1:Lcom/blank/bm15/activity/fragment/TradeFragment$2;

    iput-object p2, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$2$3;->val$listView:Landroid/widget/ListView;

    iput-object p3, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$2$3;->val$elementButton1:Landroid/widget/Button;

    iput-object p4, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$2$3;->val$findButton:Landroid/widget/Button;

    .line 230
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 8
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
    const/4 v7, 0x0

    const/4 v5, 0x0

    .line 234
    iget-object v3, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$2$3;->this$1:Lcom/blank/bm15/activity/fragment/TradeFragment$2;

    invoke-static {v3}, Lcom/blank/bm15/activity/fragment/TradeFragment$2;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment$2;)Lcom/blank/bm15/activity/fragment/TradeFragment;

    move-result-object v3

    invoke-static {v3, v5}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$3(Lcom/blank/bm15/activity/fragment/TradeFragment;Ljava/util/List;)V

    .line 236
    iget-object v3, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$2$3;->this$1:Lcom/blank/bm15/activity/fragment/TradeFragment$2;

    invoke-static {v3}, Lcom/blank/bm15/activity/fragment/TradeFragment$2;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment$2;)Lcom/blank/bm15/activity/fragment/TradeFragment;

    move-result-object v3

    invoke-static {v3}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v3

    iget-object v4, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$2$3;->this$1:Lcom/blank/bm15/activity/fragment/TradeFragment$2;

    invoke-static {v4}, Lcom/blank/bm15/activity/fragment/TradeFragment$2;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment$2;)Lcom/blank/bm15/activity/fragment/TradeFragment;

    move-result-object v4

    iget-object v4, v4, Lcom/blank/bm15/activity/fragment/TradeFragment;->FILTER_SHARED_PREFERENCE:Ljava/lang/String;

    invoke-static {v3, v4, v7}, Lcom/blank/bm15/dao/utils/BlankSharedPreferences;->getInt(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v3}, Lcom/blank/bm15/dao/utils/BlankObj;->toInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 239
    .local v1, "teamId":I
    iget-object v3, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$2$3;->val$listView:Landroid/widget/ListView;

    invoke-virtual {v3, p3}, Landroid/widget/ListView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v0

    .line 241
    .local v0, "obj":Ljava/lang/Object;
    iget-object v3, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$2$3;->this$1:Lcom/blank/bm15/activity/fragment/TradeFragment$2;

    invoke-static {v3}, Lcom/blank/bm15/activity/fragment/TradeFragment$2;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment$2;)Lcom/blank/bm15/activity/fragment/TradeFragment;

    move-result-object v3

    invoke-static {v3}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$8(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v3

    invoke-virtual {v3, v5}, Lcom/blank/bm15/model/object/crud/Trade;->setPlayerA1(Lcom/blank/bm15/model/object/crud/Player;)V

    .line 242
    iget-object v3, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$2$3;->this$1:Lcom/blank/bm15/activity/fragment/TradeFragment$2;

    invoke-static {v3}, Lcom/blank/bm15/activity/fragment/TradeFragment$2;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment$2;)Lcom/blank/bm15/activity/fragment/TradeFragment;

    move-result-object v3

    invoke-static {v3}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$8(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v3

    invoke-virtual {v3, v5}, Lcom/blank/bm15/model/object/crud/Trade;->setPlayerB1(Lcom/blank/bm15/model/object/crud/Player;)V

    .line 244
    iget-object v3, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$2$3;->this$1:Lcom/blank/bm15/activity/fragment/TradeFragment$2;

    invoke-static {v3}, Lcom/blank/bm15/activity/fragment/TradeFragment$2;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment$2;)Lcom/blank/bm15/activity/fragment/TradeFragment;

    move-result-object v3

    invoke-static {v3}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$8(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v3

    invoke-virtual {v3, v5}, Lcom/blank/bm15/model/object/crud/Trade;->setDraftRoundA1(Lcom/blank/bm15/model/object/crud/DraftRound;)V

    .line 245
    iget-object v3, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$2$3;->this$1:Lcom/blank/bm15/activity/fragment/TradeFragment$2;

    invoke-static {v3}, Lcom/blank/bm15/activity/fragment/TradeFragment$2;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment$2;)Lcom/blank/bm15/activity/fragment/TradeFragment;

    move-result-object v3

    invoke-static {v3}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$8(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v3

    invoke-virtual {v3, v5}, Lcom/blank/bm15/model/object/crud/Trade;->setDraftRoundB1(Lcom/blank/bm15/model/object/crud/DraftRound;)V

    .line 247
    instance-of v3, v0, Lcom/blank/bm15/model/object/crud/Player;

    if-eqz v3, :cond_2

    .line 248
    iget-object v3, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$2$3;->this$1:Lcom/blank/bm15/activity/fragment/TradeFragment$2;

    invoke-static {v3}, Lcom/blank/bm15/activity/fragment/TradeFragment$2;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment$2;)Lcom/blank/bm15/activity/fragment/TradeFragment;

    move-result-object v3

    invoke-static {v3}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$10(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-ne v1, v3, :cond_0

    .line 249
    iget-object v3, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$2$3;->this$1:Lcom/blank/bm15/activity/fragment/TradeFragment$2;

    invoke-static {v3}, Lcom/blank/bm15/activity/fragment/TradeFragment$2;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment$2;)Lcom/blank/bm15/activity/fragment/TradeFragment;

    move-result-object v3

    invoke-static {v3}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$8(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v4

    move-object v3, v0

    check-cast v3, Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {v4, v3}, Lcom/blank/bm15/model/object/crud/Trade;->setPlayerA1(Lcom/blank/bm15/model/object/crud/Player;)V

    .line 254
    :goto_0
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v3, " ("

    invoke-direct {v4, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$2$3;->this$1:Lcom/blank/bm15/activity/fragment/TradeFragment$2;

    invoke-static {v3}, Lcom/blank/bm15/activity/fragment/TradeFragment$2;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment$2;)Lcom/blank/bm15/activity/fragment/TradeFragment;

    move-result-object v3

    invoke-static {v3}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v5

    move-object v3, v0

    check-cast v3, Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v5, v3}, Lcom/blank/bm15/model/util/Util;->getLongPositionString(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .local v2, "text":Ljava/lang/String;
    move-object v3, v0

    .line 255
    check-cast v3, Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-eqz v3, :cond_1

    .line 256
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, " - "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v3, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$2$3;->this$1:Lcom/blank/bm15/activity/fragment/TradeFragment$2;

    invoke-static {v3}, Lcom/blank/bm15/activity/fragment/TradeFragment$2;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment$2;)Lcom/blank/bm15/activity/fragment/TradeFragment;

    move-result-object v3

    invoke-static {v3}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v5

    move-object v3, v0

    check-cast v3, Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v5, v3}, Lcom/blank/bm15/model/util/Util;->getLongPositionString(Landroid/app/Activity;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 260
    :goto_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object v3, v0

    check-cast v3, Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Player;->getAge()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$2$3;->this$1:Lcom/blank/bm15/activity/fragment/TradeFragment$2;

    invoke-static {v4}, Lcom/blank/bm15/activity/fragment/TradeFragment$2;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment$2;)Lcom/blank/bm15/activity/fragment/TradeFragment;

    move-result-object v4

    invoke-static {v4}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v4

    const v5, 0x7f050150

    invoke-virtual {v4, v5}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 262
    iget-object v4, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$2$3;->val$elementButton1:Landroid/widget/Button;

    new-instance v5, Ljava/lang/StringBuilder;

    move-object v3, v0

    check-cast v3, Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Player;->getShortName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v5, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, " - "

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    check-cast v0, Lcom/blank/bm15/model/object/crud/Player;

    .end local v0    # "obj":Ljava/lang/Object;
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getAverageSkillAll()Ljava/lang/Double;

    move-result-object v5

    invoke-static {v5}, Lcom/blank/bm15/dao/utils/BlankObj;->toInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, " "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 273
    .end local v2    # "text":Ljava/lang/String;
    :goto_2
    iget-object v3, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$2$3;->val$findButton:Landroid/widget/Button;

    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setEnabled(Z)V

    .line 276
    iget-object v3, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$2$3;->val$findButton:Landroid/widget/Button;

    iget-object v4, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$2$3;->this$1:Lcom/blank/bm15/activity/fragment/TradeFragment$2;

    invoke-static {v4}, Lcom/blank/bm15/activity/fragment/TradeFragment$2;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment$2;)Lcom/blank/bm15/activity/fragment/TradeFragment;

    move-result-object v4

    invoke-static {v4}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/activity/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f060031

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getColor(I)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 279
    iget-object v3, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$2$3;->this$1:Lcom/blank/bm15/activity/fragment/TradeFragment$2;

    invoke-static {v3}, Lcom/blank/bm15/activity/fragment/TradeFragment$2;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment$2;)Lcom/blank/bm15/activity/fragment/TradeFragment;

    move-result-object v3

    invoke-static {v3}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v3

    iget-object v3, v3, Lcom/blank/bm15/activity/HomeActivity;->alertDialog:Landroid/app/AlertDialog;

    invoke-virtual {v3}, Landroid/app/AlertDialog;->cancel()V

    .line 280
    return-void

    .line 251
    .restart local v0    # "obj":Ljava/lang/Object;
    :cond_0
    iget-object v3, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$2$3;->this$1:Lcom/blank/bm15/activity/fragment/TradeFragment$2;

    invoke-static {v3}, Lcom/blank/bm15/activity/fragment/TradeFragment$2;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment$2;)Lcom/blank/bm15/activity/fragment/TradeFragment;

    move-result-object v3

    invoke-static {v3}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$8(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v4

    move-object v3, v0

    check-cast v3, Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {v4, v3}, Lcom/blank/bm15/model/object/crud/Trade;->setPlayerB1(Lcom/blank/bm15/model/object/crud/Player;)V

    goto/16 :goto_0

    .line 258
    .restart local v2    # "text":Ljava/lang/String;
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_1

    .line 264
    .end local v2    # "text":Ljava/lang/String;
    :cond_2
    iget-object v3, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$2$3;->this$1:Lcom/blank/bm15/activity/fragment/TradeFragment$2;

    invoke-static {v3}, Lcom/blank/bm15/activity/fragment/TradeFragment$2;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment$2;)Lcom/blank/bm15/activity/fragment/TradeFragment;

    move-result-object v3

    invoke-static {v3}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$10(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-ne v1, v3, :cond_3

    .line 265
    iget-object v3, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$2$3;->this$1:Lcom/blank/bm15/activity/fragment/TradeFragment$2;

    invoke-static {v3}, Lcom/blank/bm15/activity/fragment/TradeFragment$2;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment$2;)Lcom/blank/bm15/activity/fragment/TradeFragment;

    move-result-object v3

    invoke-static {v3}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$8(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v4

    move-object v3, v0

    check-cast v3, Lcom/blank/bm15/model/object/crud/DraftRound;

    invoke-virtual {v4, v3}, Lcom/blank/bm15/model/object/crud/Trade;->setDraftRoundA1(Lcom/blank/bm15/model/object/crud/DraftRound;)V

    .line 269
    :goto_3
    iget-object v3, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$2$3;->val$elementButton1:Landroid/widget/Button;

    iget-object v4, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$2$3;->this$1:Lcom/blank/bm15/activity/fragment/TradeFragment$2;

    invoke-static {v4}, Lcom/blank/bm15/activity/fragment/TradeFragment$2;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment$2;)Lcom/blank/bm15/activity/fragment/TradeFragment;

    move-result-object v4

    invoke-static {v4}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v4

    const v5, 0x7f050184

    invoke-virtual {v4, v5}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    check-cast v0, Lcom/blank/bm15/model/object/crud/DraftRound;

    .end local v0    # "obj":Ljava/lang/Object;
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/DraftRound;->getTeamOwner()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_2

    .line 267
    .restart local v0    # "obj":Ljava/lang/Object;
    :cond_3
    iget-object v3, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$2$3;->this$1:Lcom/blank/bm15/activity/fragment/TradeFragment$2;

    invoke-static {v3}, Lcom/blank/bm15/activity/fragment/TradeFragment$2;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment$2;)Lcom/blank/bm15/activity/fragment/TradeFragment;

    move-result-object v3

    invoke-static {v3}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$8(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/model/object/crud/Trade;

    move-result-object v4

    move-object v3, v0

    check-cast v3, Lcom/blank/bm15/model/object/crud/DraftRound;

    invoke-virtual {v4, v3}, Lcom/blank/bm15/model/object/crud/Trade;->setDraftRoundB1(Lcom/blank/bm15/model/object/crud/DraftRound;)V

    goto :goto_3
.end method
