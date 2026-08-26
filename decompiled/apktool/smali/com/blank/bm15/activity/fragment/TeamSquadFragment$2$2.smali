.class Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2$2;
.super Ljava/lang/Object;
.source "TeamSquadFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2;->onItemLongClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2;

.field private final synthetic val$selectedPlayerIsTitular:Z

.field private final synthetic val$selectedPlayerMatchPosition:I

.field private final synthetic val$team:Lcom/blank/bm15/model/object/crud/Team;


# direct methods
.method constructor <init>(Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2;ZLcom/blank/bm15/model/object/crud/Team;I)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2$2;->this$1:Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2;

    iput-boolean p2, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2$2;->val$selectedPlayerIsTitular:Z

    iput-object p3, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2$2;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    iput p4, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2$2;->val$selectedPlayerMatchPosition:I

    .line 103
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "id"    # I

    .prologue
    .line 105
    iget-boolean v0, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2$2;->val$selectedPlayerIsTitular:Z

    if-eqz v0, :cond_0

    .line 106
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2$2;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v0

    new-instance v1, Lcom/blank/bm15/model/object/crud/Player;

    iget-object v2, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2$2;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Team;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/blank/bm15/model/object/crud/Player;-><init>(Landroid/content/Context;)V

    iget v2, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2$2;->val$selectedPlayerMatchPosition:I

    invoke-virtual {v0, v1, v2}, Lcom/blank/bm15/model/object/crud/Tactic;->setTitularPosition(Lcom/blank/bm15/model/object/crud/Player;I)V

    .line 110
    :goto_0
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2$2;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 111
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2$2;->this$1:Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2;->access$0(Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2;)Lcom/blank/bm15/activity/fragment/TeamSquadFragment;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->access$1(Lcom/blank/bm15/activity/fragment/TeamSquadFragment;)V

    .line 112
    return-void

    .line 108
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2$2;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v0

    new-instance v1, Lcom/blank/bm15/model/object/crud/Player;

    iget-object v2, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2$2;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Team;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/blank/bm15/model/object/crud/Player;-><init>(Landroid/content/Context;)V

    iget v2, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2$2;->val$selectedPlayerMatchPosition:I

    invoke-virtual {v0, v1, v2}, Lcom/blank/bm15/model/object/crud/Tactic;->setReservePosition(Lcom/blank/bm15/model/object/crud/Player;I)V

    goto :goto_0
.end method
