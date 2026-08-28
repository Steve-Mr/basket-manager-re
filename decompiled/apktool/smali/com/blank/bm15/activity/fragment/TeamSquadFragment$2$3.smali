.class Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2$3;
.super Ljava/lang/Object;
.source "TeamSquadFragment.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2;->onItemLongClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)Z
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
.field final synthetic this$1:Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2;

.field private final synthetic val$listView:Landroid/widget/ListView;

.field private final synthetic val$selectedPlayer:Lcom/blank/bm15/model/object/crud/Player;

.field private final synthetic val$selectedPlayerIsInLineup:Z

.field private final synthetic val$selectedPlayerIsTitular:Z

.field private final synthetic val$selectedPlayerMatchPosition:I

.field private final synthetic val$team:Lcom/blank/bm15/model/object/crud/Team;


# direct methods
.method constructor <init>(Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2;Landroid/widget/ListView;ZLcom/blank/bm15/model/object/crud/Team;Lcom/blank/bm15/model/object/crud/Player;ZI)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2$3;->this$1:Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2;

    iput-object p2, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2$3;->val$listView:Landroid/widget/ListView;

    iput-boolean p3, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2$3;->val$selectedPlayerIsInLineup:Z

    iput-object p4, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2$3;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    iput-object p5, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2$3;->val$selectedPlayer:Lcom/blank/bm15/model/object/crud/Player;

    iput-boolean p6, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2$3;->val$selectedPlayerIsTitular:Z

    iput p7, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2$3;->val$selectedPlayerMatchPosition:I

    .line 118
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 7
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
    .line 121
    .local p1, "arg0":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v4, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2$3;->val$listView:Landroid/widget/ListView;

    invoke-virtual {v4, p3}, Landroid/widget/ListView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/blank/bm15/model/object/other/StringText;

    .line 123
    .local v3, "stringText":Lcom/blank/bm15/model/object/other/StringText;
    invoke-virtual {v3}, Lcom/blank/bm15/model/object/other/StringText;->getId()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 124
    .local v1, "newMatchPosition":I
    const/4 v4, 0x6

    if-ge v1, v4, :cond_2

    const/4 v2, 0x1

    .line 125
    .local v2, "newMatchPositionIsTitular":Z
    :goto_0
    if-nez v2, :cond_0

    .line 126
    add-int/lit8 v1, v1, -0x5

    .line 129
    :cond_0
    const/4 v0, 0x0

    .line 130
    .local v0, "auxPlayer":Lcom/blank/bm15/model/object/crud/Player;
    iget-boolean v4, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2$3;->val$selectedPlayerIsInLineup:Z

    if-eqz v4, :cond_1

    .line 131
    if-eqz v2, :cond_3

    .line 132
    iget-object v4, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2$3;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v4

    invoke-virtual {v4, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->getTitularPlayer(I)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v0

    .line 137
    :goto_1
    if-eqz v0, :cond_6

    .line 138
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iget-object v5, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2$3;->val$selectedPlayer:Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getId()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-ne v4, v5, :cond_4

    .line 139
    iget-object v4, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2$3;->this$1:Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2;

    invoke-static {v4}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2;->access$0(Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2;)Lcom/blank/bm15/activity/fragment/TeamSquadFragment;

    move-result-object v4

    invoke-static {v4}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->access$0(Lcom/blank/bm15/activity/fragment/TeamSquadFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v4

    iget-object v4, v4, Lcom/blank/bm15/activity/HomeActivity;->alertDialog:Landroid/app/AlertDialog;

    invoke-virtual {v4}, Landroid/app/AlertDialog;->cancel()V

    .line 156
    :cond_1
    :goto_2
    if-eqz v2, :cond_8

    .line 157
    iget-object v4, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2$3;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v4

    iget-object v5, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2$3;->val$selectedPlayer:Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {v4, v5, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->setTitularPosition(Lcom/blank/bm15/model/object/crud/Player;I)V

    .line 162
    :goto_3
    iget-object v4, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2$3;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v4

    invoke-static {v4}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 163
    iget-object v4, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2$3;->this$1:Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2;

    invoke-static {v4}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2;->access$0(Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2;)Lcom/blank/bm15/activity/fragment/TeamSquadFragment;

    move-result-object v4

    invoke-static {v4}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->access$0(Lcom/blank/bm15/activity/fragment/TeamSquadFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v4

    iget-object v4, v4, Lcom/blank/bm15/activity/HomeActivity;->alertDialog:Landroid/app/AlertDialog;

    invoke-virtual {v4}, Landroid/app/AlertDialog;->cancel()V

    .line 164
    iget-object v4, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2$3;->this$1:Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2;

    invoke-static {v4}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2;->access$0(Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2;)Lcom/blank/bm15/activity/fragment/TeamSquadFragment;

    move-result-object v4

    invoke-static {v4}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->access$1(Lcom/blank/bm15/activity/fragment/TeamSquadFragment;)V

    .line 165
    return-void

    .line 124
    .end local v0    # "auxPlayer":Lcom/blank/bm15/model/object/crud/Player;
    .end local v2    # "newMatchPositionIsTitular":Z
    :cond_2
    const/4 v2, 0x0

    goto :goto_0

    .line 134
    .restart local v0    # "auxPlayer":Lcom/blank/bm15/model/object/crud/Player;
    .restart local v2    # "newMatchPositionIsTitular":Z
    :cond_3
    iget-object v4, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2$3;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v4

    invoke-virtual {v4, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->getReservePlayer(I)Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v0

    goto :goto_1

    .line 141
    :cond_4
    iget-boolean v4, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2$3;->val$selectedPlayerIsTitular:Z

    if-eqz v4, :cond_5

    .line 142
    iget-object v4, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2$3;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v4

    iget v5, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2$3;->val$selectedPlayerMatchPosition:I

    invoke-virtual {v4, v0, v5}, Lcom/blank/bm15/model/object/crud/Tactic;->setTitularPosition(Lcom/blank/bm15/model/object/crud/Player;I)V

    goto :goto_2

    .line 143
    :cond_5
    iget-object v4, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2$3;->val$selectedPlayer:Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Player;->getIsReserve()Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 144
    iget-object v4, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2$3;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v4

    iget v5, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2$3;->val$selectedPlayerMatchPosition:I

    invoke-virtual {v4, v0, v5}, Lcom/blank/bm15/model/object/crud/Tactic;->setReservePosition(Lcom/blank/bm15/model/object/crud/Player;I)V

    goto :goto_2

    .line 148
    :cond_6
    iget-boolean v4, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2$3;->val$selectedPlayerIsTitular:Z

    if-eqz v4, :cond_7

    .line 149
    iget-object v4, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2$3;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v4

    new-instance v5, Lcom/blank/bm15/model/object/crud/Player;

    iget-object v6, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2$3;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Team;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/blank/bm15/model/object/crud/Player;-><init>(Landroid/content/Context;)V

    iget v6, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2$3;->val$selectedPlayerMatchPosition:I

    invoke-virtual {v4, v5, v6}, Lcom/blank/bm15/model/object/crud/Tactic;->setTitularPosition(Lcom/blank/bm15/model/object/crud/Player;I)V

    goto :goto_2

    .line 151
    :cond_7
    iget-object v4, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2$3;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v4

    new-instance v5, Lcom/blank/bm15/model/object/crud/Player;

    iget-object v6, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2$3;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Team;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/blank/bm15/model/object/crud/Player;-><init>(Landroid/content/Context;)V

    iget v6, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2$3;->val$selectedPlayerMatchPosition:I

    invoke-virtual {v4, v5, v6}, Lcom/blank/bm15/model/object/crud/Tactic;->setReservePosition(Lcom/blank/bm15/model/object/crud/Player;I)V

    goto/16 :goto_2

    .line 159
    :cond_8
    iget-object v4, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2$3;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v4

    iget-object v5, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2$3;->val$selectedPlayer:Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {v4, v5, v1}, Lcom/blank/bm15/model/object/crud/Tactic;->setReservePosition(Lcom/blank/bm15/model/object/crud/Player;I)V

    goto/16 :goto_3
.end method
