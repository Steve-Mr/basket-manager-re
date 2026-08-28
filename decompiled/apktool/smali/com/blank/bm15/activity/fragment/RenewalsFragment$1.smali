.class Lcom/blank/bm15/activity/fragment/RenewalsFragment$1;
.super Ljava/lang/Object;
.source "RenewalsFragment.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blank/bm15/activity/fragment/RenewalsFragment;->loadList(Landroid/view/View;)V
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
.field final synthetic this$0:Lcom/blank/bm15/activity/fragment/RenewalsFragment;

.field private final synthetic val$listView:Landroid/widget/ListView;


# direct methods
.method constructor <init>(Lcom/blank/bm15/activity/fragment/RenewalsFragment;Landroid/widget/ListView;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/blank/bm15/activity/fragment/RenewalsFragment$1;->this$0:Lcom/blank/bm15/activity/fragment/RenewalsFragment;

    iput-object p2, p0, Lcom/blank/bm15/activity/fragment/RenewalsFragment$1;->val$listView:Landroid/widget/ListView;

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/blank/bm15/activity/fragment/RenewalsFragment$1;)Lcom/blank/bm15/activity/fragment/RenewalsFragment;
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/RenewalsFragment$1;->this$0:Lcom/blank/bm15/activity/fragment/RenewalsFragment;

    return-object v0
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 16
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
    .line 61
    .local p1, "arg0":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/blank/bm15/activity/fragment/RenewalsFragment$1;->val$listView:Landroid/widget/ListView;

    move/from16 v0, p3

    invoke-virtual {v11, v0}, Landroid/widget/ListView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/blank/bm15/model/object/crud/Player;

    .line 63
    .local v9, "player":Lcom/blank/bm15/model/object/crud/Player;
    new-instance v4, Lcom/blank/bm15/model/object/crud/Offer;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/blank/bm15/activity/fragment/RenewalsFragment$1;->this$0:Lcom/blank/bm15/activity/fragment/RenewalsFragment;

    invoke-static {v11}, Lcom/blank/bm15/activity/fragment/RenewalsFragment;->access$0(Lcom/blank/bm15/activity/fragment/RenewalsFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v11

    invoke-direct {v4, v11}, Lcom/blank/bm15/model/object/crud/Offer;-><init>(Landroid/content/Context;)V

    .line 64
    .local v4, "filter":Lcom/blank/bm15/model/object/crud/Offer;
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/blank/bm15/activity/fragment/RenewalsFragment$1;->this$0:Lcom/blank/bm15/activity/fragment/RenewalsFragment;

    invoke-static {v11}, Lcom/blank/bm15/activity/fragment/RenewalsFragment;->access$1(Lcom/blank/bm15/activity/fragment/RenewalsFragment;)Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v11

    invoke-virtual {v4, v11}, Lcom/blank/bm15/model/object/crud/Offer;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 65
    invoke-virtual {v4, v9}, Lcom/blank/bm15/model/object/crud/Offer;->setPlayer(Lcom/blank/bm15/model/object/crud/Player;)V

    .line 66
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/blank/bm15/activity/fragment/RenewalsFragment$1;->this$0:Lcom/blank/bm15/activity/fragment/RenewalsFragment;

    invoke-static {v11}, Lcom/blank/bm15/activity/fragment/RenewalsFragment;->access$1(Lcom/blank/bm15/activity/fragment/RenewalsFragment;)Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v11

    invoke-virtual {v11}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v11

    invoke-virtual {v4, v11}, Lcom/blank/bm15/model/object/crud/Offer;->setTeam(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 67
    invoke-static {v4}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v2

    .line 69
    .local v2, "currentOfferList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Offer;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :cond_0
    :goto_0
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-nez v12, :cond_1

    .line 78
    new-instance v1, Landroid/app/AlertDialog$Builder;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/blank/bm15/activity/fragment/RenewalsFragment$1;->this$0:Lcom/blank/bm15/activity/fragment/RenewalsFragment;

    invoke-static {v11}, Lcom/blank/bm15/activity/fragment/RenewalsFragment;->access$0(Lcom/blank/bm15/activity/fragment/RenewalsFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v11

    invoke-direct {v1, v11}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 79
    .local v1, "builder":Landroid/app/AlertDialog$Builder;
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/blank/bm15/activity/fragment/RenewalsFragment$1;->this$0:Lcom/blank/bm15/activity/fragment/RenewalsFragment;

    invoke-static {v11}, Lcom/blank/bm15/activity/fragment/RenewalsFragment;->access$0(Lcom/blank/bm15/activity/fragment/RenewalsFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v11

    invoke-virtual {v11}, Lcom/blank/bm15/activity/HomeActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v5

    .line 81
    .local v5, "inflater":Landroid/view/LayoutInflater;
    const v11, 0x7f030005

    const/4 v12, 0x0

    invoke-virtual {v5, v11, v12}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v3

    .line 82
    .local v3, "dialogView":Landroid/view/View;
    const v11, 0x7f0b002c

    invoke-virtual {v3, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    .line 83
    .local v10, "textView":Landroid/widget/TextView;
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/blank/bm15/activity/fragment/RenewalsFragment$1;->this$0:Lcom/blank/bm15/activity/fragment/RenewalsFragment;

    const v12, 0x7f05014e

    invoke-virtual {v11, v12}, Lcom/blank/bm15/activity/fragment/RenewalsFragment;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 85
    const v11, 0x7f0b002d

    invoke-virtual {v3, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    .end local v10    # "textView":Landroid/widget/TextView;
    check-cast v10, Landroid/widget/TextView;

    .line 86
    .restart local v10    # "textView":Landroid/widget/TextView;
    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "("

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/blank/bm15/activity/fragment/RenewalsFragment$1;->this$0:Lcom/blank/bm15/activity/fragment/RenewalsFragment;

    const v13, 0x7f050152

    invoke-virtual {v12, v13}, Lcom/blank/bm15/activity/fragment/RenewalsFragment;->getString(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ": "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Player;->getSalary()Ljava/lang/Integer;

    move-result-object v12

    invoke-static {v12}, Lcom/blank/bm15/model/util/Util;->formatSalary(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ")"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 88
    invoke-virtual {v1, v3}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v11

    .line 89
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/blank/bm15/activity/fragment/RenewalsFragment$1;->this$0:Lcom/blank/bm15/activity/fragment/RenewalsFragment;

    const v13, 0x7f050048

    invoke-virtual {v12, v13}, Lcom/blank/bm15/activity/fragment/RenewalsFragment;->getString(I)Ljava/lang/String;

    move-result-object v12

    new-instance v13, Lcom/blank/bm15/activity/fragment/RenewalsFragment$1$1;

    move-object/from16 v0, p0

    invoke-direct {v13, v0}, Lcom/blank/bm15/activity/fragment/RenewalsFragment$1$1;-><init>(Lcom/blank/bm15/activity/fragment/RenewalsFragment$1;)V

    invoke-virtual {v11, v12, v13}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 95
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 96
    .local v8, "offerList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Offer;>;"
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/blank/bm15/activity/fragment/RenewalsFragment$1;->this$0:Lcom/blank/bm15/activity/fragment/RenewalsFragment;

    invoke-static {v11}, Lcom/blank/bm15/activity/fragment/RenewalsFragment;->access$1(Lcom/blank/bm15/activity/fragment/RenewalsFragment;)Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v11

    const/16 v12, -0x19

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    const/16 v13, -0x10

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v12

    invoke-static {v11, v9, v12}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->getOffer(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Player;I)Lcom/blank/bm15/model/object/crud/Offer;

    move-result-object v11

    invoke-interface {v8, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 97
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/blank/bm15/activity/fragment/RenewalsFragment$1;->this$0:Lcom/blank/bm15/activity/fragment/RenewalsFragment;

    invoke-static {v11}, Lcom/blank/bm15/activity/fragment/RenewalsFragment;->access$1(Lcom/blank/bm15/activity/fragment/RenewalsFragment;)Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v11

    const/16 v12, -0xf

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    const/4 v13, -0x6

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v12

    invoke-static {v11, v9, v12}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->getOffer(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Player;I)Lcom/blank/bm15/model/object/crud/Offer;

    move-result-object v11

    invoke-interface {v8, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 98
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/blank/bm15/activity/fragment/RenewalsFragment$1;->this$0:Lcom/blank/bm15/activity/fragment/RenewalsFragment;

    invoke-static {v11}, Lcom/blank/bm15/activity/fragment/RenewalsFragment;->access$1(Lcom/blank/bm15/activity/fragment/RenewalsFragment;)Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v11

    const/4 v12, -0x5

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    const/4 v13, 0x5

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v12

    invoke-static {v11, v9, v12}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->getOffer(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Player;I)Lcom/blank/bm15/model/object/crud/Offer;

    move-result-object v11

    invoke-interface {v8, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 99
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/blank/bm15/activity/fragment/RenewalsFragment$1;->this$0:Lcom/blank/bm15/activity/fragment/RenewalsFragment;

    invoke-static {v11}, Lcom/blank/bm15/activity/fragment/RenewalsFragment;->access$1(Lcom/blank/bm15/activity/fragment/RenewalsFragment;)Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v11

    const/4 v12, 0x6

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    const/16 v13, 0xf

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v12

    invoke-static {v11, v9, v12}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->getOffer(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Player;I)Lcom/blank/bm15/model/object/crud/Offer;

    move-result-object v11

    invoke-interface {v8, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 100
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/blank/bm15/activity/fragment/RenewalsFragment$1;->this$0:Lcom/blank/bm15/activity/fragment/RenewalsFragment;

    invoke-static {v11}, Lcom/blank/bm15/activity/fragment/RenewalsFragment;->access$1(Lcom/blank/bm15/activity/fragment/RenewalsFragment;)Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v11

    const/16 v12, 0x10

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    const/16 v13, 0x19

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/blank/bm15/model/util/Util;->getRandomValue(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v12

    invoke-static {v11, v9, v12}, Lcom/blank/bm15/activity/fragment/FreeAgentsFragment;->getOffer(Lcom/blank/bm15/model/object/crud/Game;Lcom/blank/bm15/model/object/crud/Player;I)Lcom/blank/bm15/model/object/crud/Offer;

    move-result-object v11

    invoke-interface {v8, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 102
    const v11, 0x7f0b002e

    invoke-virtual {v3, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/ListView;

    .line 103
    .local v6, "listView":Landroid/widget/ListView;
    new-instance v11, Lcom/blank/bm15/activity/adapter/AdapterOfferList;

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/blank/bm15/activity/fragment/RenewalsFragment$1;->this$0:Lcom/blank/bm15/activity/fragment/RenewalsFragment;

    invoke-static {v12}, Lcom/blank/bm15/activity/fragment/RenewalsFragment;->access$0(Lcom/blank/bm15/activity/fragment/RenewalsFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v12

    const v13, 0x7f03001e

    invoke-direct {v11, v12, v13, v8}, Lcom/blank/bm15/activity/adapter/AdapterOfferList;-><init>(Landroid/content/Context;ILjava/util/List;)V

    invoke-virtual {v6, v11}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 104
    new-instance v11, Lcom/blank/bm15/activity/fragment/RenewalsFragment$1$2;

    move-object/from16 v0, p0

    invoke-direct {v11, v0, v6, v9}, Lcom/blank/bm15/activity/fragment/RenewalsFragment$1$2;-><init>(Lcom/blank/bm15/activity/fragment/RenewalsFragment$1;Landroid/widget/ListView;Lcom/blank/bm15/model/object/crud/Player;)V

    invoke-virtual {v6, v11}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 114
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/blank/bm15/activity/fragment/RenewalsFragment$1;->this$0:Lcom/blank/bm15/activity/fragment/RenewalsFragment;

    invoke-static {v11}, Lcom/blank/bm15/activity/fragment/RenewalsFragment;->access$0(Lcom/blank/bm15/activity/fragment/RenewalsFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v11

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v12

    iput-object v12, v11, Lcom/blank/bm15/activity/HomeActivity;->alertDialog:Landroid/app/AlertDialog;

    .line 115
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/blank/bm15/activity/fragment/RenewalsFragment$1;->this$0:Lcom/blank/bm15/activity/fragment/RenewalsFragment;

    invoke-static {v11}, Lcom/blank/bm15/activity/fragment/RenewalsFragment;->access$0(Lcom/blank/bm15/activity/fragment/RenewalsFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v11

    iget-object v11, v11, Lcom/blank/bm15/activity/HomeActivity;->alertDialog:Landroid/app/AlertDialog;

    invoke-virtual {v11}, Landroid/app/AlertDialog;->show()V

    .line 116
    .end local v1    # "builder":Landroid/app/AlertDialog$Builder;
    .end local v3    # "dialogView":Landroid/view/View;
    .end local v5    # "inflater":Landroid/view/LayoutInflater;
    .end local v6    # "listView":Landroid/widget/ListView;
    .end local v8    # "offerList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Offer;>;"
    .end local v10    # "textView":Landroid/widget/TextView;
    :goto_1
    return-void

    .line 69
    :cond_1
    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/blank/bm15/model/object/crud/Offer;

    .line 70
    .local v7, "offer":Lcom/blank/bm15/model/object/crud/Offer;
    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Offer;->getMatchday()Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v12

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/blank/bm15/activity/fragment/RenewalsFragment$1;->this$0:Lcom/blank/bm15/activity/fragment/RenewalsFragment;

    invoke-static {v13}, Lcom/blank/bm15/activity/fragment/RenewalsFragment;->access$1(Lcom/blank/bm15/activity/fragment/RenewalsFragment;)Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v13

    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    add-int/lit8 v13, v13, -0x1

    if-ne v12, v13, :cond_2

    .line 71
    invoke-static {v7}, Lcom/blank/bm15/dao/BlankDao;->delete(Lcom/blank/bm15/dao/utils/BlankBase;)V

    goto/16 :goto_0

    .line 72
    :cond_2
    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Offer;->getSalary()Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v12

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/blank/bm15/activity/fragment/RenewalsFragment$1;->this$0:Lcom/blank/bm15/activity/fragment/RenewalsFragment;

    invoke-static {v13}, Lcom/blank/bm15/activity/fragment/RenewalsFragment;->access$1(Lcom/blank/bm15/activity/fragment/RenewalsFragment;)Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v13

    invoke-virtual {v13}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    if-lt v12, v13, :cond_0

    .line 73
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/blank/bm15/activity/fragment/RenewalsFragment$1;->this$0:Lcom/blank/bm15/activity/fragment/RenewalsFragment;

    invoke-static {v11}, Lcom/blank/bm15/activity/fragment/RenewalsFragment;->access$0(Lcom/blank/bm15/activity/fragment/RenewalsFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v11

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/blank/bm15/activity/fragment/RenewalsFragment$1;->this$0:Lcom/blank/bm15/activity/fragment/RenewalsFragment;

    invoke-virtual {v12}, Lcom/blank/bm15/activity/fragment/RenewalsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    const v13, 0x7f050071

    invoke-virtual {v12, v13}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x1

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Offer;->getPlayer()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v15

    invoke-virtual {v15}, Lcom/blank/bm15/model/object/crud/Player;->getShortName()Ljava/lang/String;

    move-result-object v15

    aput-object v15, v13, v14

    invoke-static {v12, v13}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/blank/bm15/model/util/Alert;->showWarningDialog(Landroid/app/Activity;Ljava/lang/String;)V

    goto :goto_1
.end method
