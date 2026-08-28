.class Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;
.super Ljava/lang/Object;
.source "FreeAgentsFragment.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->create()V
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
.field final synthetic this$0:Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;

.field private final synthetic val$listView:Landroid/widget/ListView;

.field private final synthetic val$playerList:Ljava/util/List;


# direct methods
.method constructor <init>(Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;Landroid/widget/ListView;Ljava/util/List;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;->this$0:Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;

    iput-object p2, p0, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;->val$listView:Landroid/widget/ListView;

    iput-object p3, p0, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;->val$playerList:Ljava/util/List;

    .line 128
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;)Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;
    .locals 1

    .prologue
    .line 128
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;->this$0:Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;

    return-object v0
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 17
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
    .line 131
    .local p1, "arg0":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;->this$0:Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->access$2(Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;)Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    const/16 v2, 0x14

    if-ge v1, v2, :cond_2

    .line 132
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;->val$listView:Landroid/widget/ListView;

    move/from16 v0, p3

    invoke-virtual {v1, v0}, Landroid/widget/ListView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/blank/bm15/model/object/crud/Player;

    .line 134
    .local v5, "player":Lcom/blank/bm15/model/object/crud/Player;
    new-instance v10, Lcom/blank/bm15/model/object/crud/Offer;

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;->this$0:Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->access$0(Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v1

    invoke-direct {v10, v1}, Lcom/blank/bm15/model/object/crud/Offer;-><init>(Landroid/content/Context;)V

    .line 135
    .local v10, "filter":Lcom/blank/bm15/model/object/crud/Offer;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;->this$0:Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->access$2(Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;)Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v1

    invoke-virtual {v10, v1}, Lcom/blank/bm15/model/object/crud/Offer;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 136
    invoke-virtual {v10, v5}, Lcom/blank/bm15/model/object/crud/Offer;->setPlayer(Lcom/blank/bm15/model/object/crud/Player;)V

    .line 137
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;->this$0:Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->access$2(Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;)Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    invoke-virtual {v10, v1}, Lcom/blank/bm15/model/object/crud/Offer;->setTeam(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 138
    invoke-static {v10}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v8

    .line 140
    .local v8, "currentOfferList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Offer;>;"
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 149
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;->this$0:Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->access$2(Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;)Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Team;->getSalaryCap()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;->this$0:Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;

    invoke-static {v2}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->access$2(Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;)Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v2

    invoke-virtual {v2, v5}, Lcom/blank/bm15/model/object/crud/Team;->getTeamSalary(Lcom/blank/bm15/model/object/crud/Player;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .line 151
    .local v4, "salaryAvailable":Ljava/lang/Integer;
    new-instance v7, Landroid/app/AlertDialog$Builder;

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;->this$0:Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->access$0(Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v1

    invoke-direct {v7, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 152
    .local v7, "builder":Landroid/app/AlertDialog$Builder;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;->this$0:Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->access$0(Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/blank/bm15/activity/HomeActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v11

    .line 154
    .local v11, "inflater":Landroid/view/LayoutInflater;
    const v1, 0x7f030005

    const/4 v2, 0x0

    invoke-virtual {v11, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v9

    .line 155
    .local v9, "dialogView":Landroid/view/View;
    const v1, 0x7f0b002c

    invoke-virtual {v9, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v14

    check-cast v14, Landroid/widget/TextView;

    .line 156
    .local v14, "textView":Landroid/widget/TextView;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;->this$0:Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;

    const v2, 0x7f05014e

    invoke-virtual {v1, v2}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v14, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 158
    const v1, 0x7f0b002d

    invoke-virtual {v9, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v14

    .end local v14    # "textView":Landroid/widget/TextView;
    check-cast v14, Landroid/widget/TextView;

    .line 159
    .restart local v14    # "textView":Landroid/widget/TextView;
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "("

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;->this$0:Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;

    const v6, 0x7f050151

    invoke-virtual {v2, v6}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {v4}, Lcom/blank/bm15/model/util/Util;->formatSalary(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v14, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 161
    invoke-virtual {v7, v9}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 162
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;->this$0:Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;

    const v6, 0x7f050048

    invoke-virtual {v2, v6}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v6, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2$1;

    move-object/from16 v0, p0

    invoke-direct {v6, v0}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2$1;-><init>(Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;)V

    invoke-virtual {v1, v2, v6}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 168
    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    .line 169
    .local v13, "offerList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Offer;>;"
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;->this$0:Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->access$2(Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;)Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v1

    const/16 v2, -0x19

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/16 v6, -0x10

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v2, v6}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {v1, v5, v2}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->getOffer(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Player;I)Lcom/blank/bm15/model/object/crud/Offer;

    move-result-object v1

    invoke-interface {v13, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 170
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;->this$0:Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->access$2(Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;)Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v1

    const/16 v2, -0xf

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v6, -0x6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v2, v6}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {v1, v5, v2}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->getOffer(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Player;I)Lcom/blank/bm15/model/object/crud/Offer;

    move-result-object v1

    invoke-interface {v13, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 171
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;->this$0:Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->access$2(Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;)Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v1

    const/4 v2, -0x5

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v6, 0x5

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v2, v6}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {v1, v5, v2}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->getOffer(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Player;I)Lcom/blank/bm15/model/object/crud/Offer;

    move-result-object v1

    invoke-interface {v13, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 172
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;->this$0:Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->access$2(Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;)Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v1

    const/4 v2, 0x6

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/16 v6, 0xf

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v2, v6}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {v1, v5, v2}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->getOffer(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Player;I)Lcom/blank/bm15/model/object/crud/Offer;

    move-result-object v1

    invoke-interface {v13, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 173
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;->this$0:Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->access$2(Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;)Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v1

    const/16 v2, 0x10

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/16 v6, 0x19

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v2, v6}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {v1, v5, v2}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->getOffer(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Player;I)Lcom/blank/bm15/model/object/crud/Offer;

    move-result-object v1

    invoke-interface {v13, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 175
    const v1, 0x7f0b002e

    invoke-virtual {v9, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ListView;

    .line 176
    .local v3, "listView":Landroid/widget/ListView;
    new-instance v1, Lcom/blank/bm15/activity/adapter/AdapterOfferList;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;->this$0:Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;

    invoke-static {v2}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->access$0(Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v2

    const v6, 0x7f03001e

    invoke-direct {v1, v2, v6, v13}, Lcom/blank/bm15/activity/adapter/AdapterOfferList;-><init>(Landroid/content/Context;ILjava/util/List;)V

    invoke-virtual {v3, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 177
    new-instance v1, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2$2;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;->val$playerList:Ljava/util/List;

    move-object/from16 v2, p0

    invoke-direct/range {v1 .. v6}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2$2;-><init>(Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;Landroid/widget/ListView;Ljava/lang/Integer;Lcom/blank/bm15/model/object/crud/Player;Ljava/util/List;)V

    invoke-virtual {v3, v1}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 202
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;->this$0:Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->access$0(Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v1

    invoke-virtual {v7}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v2

    iput-object v2, v1, Lcom/blank/bm15/activity/HomeActivity;->alertDialog:Landroid/app/AlertDialog;

    .line 203
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;->this$0:Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->access$0(Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v1

    iget-object v1, v1, Lcom/blank/bm15/activity/HomeActivity;->alertDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    .line 207
    .end local v3    # "listView":Landroid/widget/ListView;
    .end local v4    # "salaryAvailable":Ljava/lang/Integer;
    .end local v5    # "player":Lcom/blank/bm15/model/object/crud/Player;
    .end local v7    # "builder":Landroid/app/AlertDialog$Builder;
    .end local v8    # "currentOfferList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Offer;>;"
    .end local v9    # "dialogView":Landroid/view/View;
    .end local v10    # "filter":Lcom/blank/bm15/model/object/crud/Offer;
    .end local v11    # "inflater":Landroid/view/LayoutInflater;
    .end local v13    # "offerList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Offer;>;"
    .end local v14    # "textView":Landroid/widget/TextView;
    :goto_1
    return-void

    .line 140
    .restart local v5    # "player":Lcom/blank/bm15/model/object/crud/Player;
    .restart local v8    # "currentOfferList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Offer;>;"
    .restart local v10    # "filter":Lcom/blank/bm15/model/object/crud/Offer;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/blank/bm15/model/object/crud/Offer;

    .line 141
    .local v12, "offer":Lcom/blank/bm15/model/object/crud/Offer;
    invoke-virtual {v12}, Lcom/blank/bm15/model/object/crud/Offer;->getSalary()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;->this$0:Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;

    invoke-static {v6}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->access$2(Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;)Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v6

    invoke-virtual {v6}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-lt v2, v6, :cond_1

    .line 142
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;->this$0:Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->access$0(Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v1

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;->this$0:Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;

    invoke-virtual {v2}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v6, 0x7f050071

    invoke-virtual {v2, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v15, 0x0

    invoke-virtual {v12}, Lcom/blank/bm15/model/object/crud/Offer;->getPlayer()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Lcom/blank/bm15/model/object/crud/Player;->getShortName()Ljava/lang/String;

    move-result-object v16

    aput-object v16, v6, v15

    invoke-static {v2, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/blank/bm15/model/util/Alert;->showWarningDialog(Landroid/app/Activity;Ljava/lang/String;)V

    goto :goto_1

    .line 145
    :cond_1
    invoke-static {v12}, Lcom/blank/bm15/dao/BlankDao;->delete(Lcom/blank/bm15/dao/utils/BlankBase;)V

    goto/16 :goto_0

    .line 205
    .end local v5    # "player":Lcom/blank/bm15/model/object/crud/Player;
    .end local v8    # "currentOfferList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Offer;>;"
    .end local v10    # "filter":Lcom/blank/bm15/model/object/crud/Offer;
    .end local v12    # "offer":Lcom/blank/bm15/model/object/crud/Offer;
    :cond_2
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;->this$0:Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->access$0(Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v1

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment$2;->this$0:Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;

    invoke-virtual {v2}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v6, 0x7f050070

    invoke-virtual {v2, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/blank/bm15/model/util/Alert;->showWarningDialog(Landroid/app/Activity;Ljava/lang/String;)V

    goto :goto_1
.end method
