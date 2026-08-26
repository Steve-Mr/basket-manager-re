.class Lcom/blank/bm15/activity/fragment/TeamSquadFragment$4;
.super Ljava/lang/Object;
.source "TeamSquadFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->createPage()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/blank/bm15/activity/fragment/TeamSquadFragment;


# direct methods
.method constructor <init>(Lcom/blank/bm15/activity/fragment/TeamSquadFragment;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$4;->this$0:Lcom/blank/bm15/activity/fragment/TeamSquadFragment;

    .line 186
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 13
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v12, 0x1

    const/4 v11, 0x0

    .line 189
    new-instance v3, Lcom/blank/bm15/model/object/crud/DraftRound;

    iget-object v6, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$4;->this$0:Lcom/blank/bm15/activity/fragment/TeamSquadFragment;

    invoke-static {v6}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->access$0(Lcom/blank/bm15/activity/fragment/TeamSquadFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v6

    invoke-direct {v3, v6}, Lcom/blank/bm15/model/object/crud/DraftRound;-><init>(Landroid/content/Context;)V

    .line 190
    .local v3, "draftRoundFilter":Lcom/blank/bm15/model/object/crud/DraftRound;
    iget-object v6, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$4;->this$0:Lcom/blank/bm15/activity/fragment/TeamSquadFragment;

    invoke-static {v6}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->access$3(Lcom/blank/bm15/activity/fragment/TeamSquadFragment;)Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v6

    invoke-virtual {v3, v6}, Lcom/blank/bm15/model/object/crud/DraftRound;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 191
    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/DraftRound;->getTeamUser()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v6

    iget-object v7, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$4;->this$0:Lcom/blank/bm15/activity/fragment/TeamSquadFragment;

    invoke-static {v7}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->access$3(Lcom/blank/bm15/activity/fragment/TeamSquadFragment;)Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v7

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v7

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/blank/bm15/model/object/crud/Team;->setId(Ljava/lang/Integer;)V

    .line 192
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v3, v6}, Lcom/blank/bm15/model/object/crud/DraftRound;->setRound(Ljava/lang/Integer;)V

    .line 193
    invoke-static {v3}, Lcom/blank/bm15/dao/BlankDao;->getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v4

    .line 194
    .local v4, "draftRoundList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/DraftRound;>;"
    new-instance v6, Lcom/blank/bm15/model/comparator/DraftRoundComparator;

    invoke-direct {v6, v11, v12}, Lcom/blank/bm15/model/comparator/DraftRoundComparator;-><init>(II)V

    invoke-static {v4, v6}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 196
    const-string v5, ""

    .line 197
    .local v5, "text":Ljava/lang/String;
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-nez v7, :cond_0

    .line 200
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$4;->this$0:Lcom/blank/bm15/activity/fragment/TeamSquadFragment;

    invoke-static {v7}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->access$0(Lcom/blank/bm15/activity/fragment/TeamSquadFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v7

    const v8, 0x7f050185

    invoke-virtual {v7, v8}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v7

    new-array v8, v12, [Ljava/lang/Object;

    iget-object v9, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$4;->this$0:Lcom/blank/bm15/activity/fragment/TeamSquadFragment;

    invoke-static {v9}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->access$3(Lcom/blank/bm15/activity/fragment/TeamSquadFragment;)Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v9

    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v9

    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v11

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 202
    iget-object v6, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$4;->this$0:Lcom/blank/bm15/activity/fragment/TeamSquadFragment;

    invoke-static {v6}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->access$0(Lcom/blank/bm15/activity/fragment/TeamSquadFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v6

    invoke-static {v6}, Lcom/blank/bm15/model/util/Alert;->getBuilder(Landroid/app/Activity;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 203
    .local v1, "builder":Landroid/app/AlertDialog$Builder;
    iget-object v6, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$4;->this$0:Lcom/blank/bm15/activity/fragment/TeamSquadFragment;

    const v7, 0x7f050183

    invoke-virtual {v6, v7}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    .line 204
    invoke-virtual {v6, v5}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    .line 205
    invoke-virtual {v6, v11}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    .line 206
    const v7, 0x7f02002f

    invoke-virtual {v6, v7}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    .line 207
    iget-object v7, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$4;->this$0:Lcom/blank/bm15/activity/fragment/TeamSquadFragment;

    const v8, 0x7f05004a

    invoke-virtual {v7, v8}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->getString(I)Ljava/lang/String;

    move-result-object v7

    new-instance v8, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$4$1;

    invoke-direct {v8, p0}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$4$1;-><init>(Lcom/blank/bm15/activity/fragment/TeamSquadFragment$4;)V

    invoke-virtual {v6, v7, v8}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 212
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 213
    .local v0, "alert":Landroid/app/AlertDialog;
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 215
    iget-object v6, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$4;->this$0:Lcom/blank/bm15/activity/fragment/TeamSquadFragment;

    invoke-static {v6}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->access$1(Lcom/blank/bm15/activity/fragment/TeamSquadFragment;)V

    .line 216
    return-void

    .line 197
    .end local v0    # "alert":Landroid/app/AlertDialog;
    .end local v1    # "builder":Landroid/app/AlertDialog$Builder;
    :cond_0
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/blank/bm15/model/object/crud/DraftRound;

    .line 198
    .local v2, "draftRound":Lcom/blank/bm15/model/object/crud/DraftRound;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v8, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$4;->this$0:Lcom/blank/bm15/activity/fragment/TeamSquadFragment;

    invoke-static {v8}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->access$0(Lcom/blank/bm15/activity/fragment/TeamSquadFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v8

    const v9, 0x7f050184

    invoke-virtual {v8, v9}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v8

    new-array v9, v12, [Ljava/lang/Object;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/DraftRound;->getTeamOwner()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v10

    invoke-virtual {v10}, Lcom/blank/bm15/model/object/crud/Team;->getName()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v9, v11

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\n"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto/16 :goto_0
.end method
