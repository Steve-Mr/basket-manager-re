.class Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment$1;
.super Ljava/lang/Object;
.source "PlayerSkillsFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->createPage()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;

.field private final synthetic val$player:Lcom/blank/bm15/model/object/crud/Player;


# direct methods
.method constructor <init>(Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;Lcom/blank/bm15/model/object/crud/Player;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment$1;->this$0:Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;

    iput-object p2, p0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment$1;->val$player:Lcom/blank/bm15/model/object/crud/Player;

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 67
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment$1;->val$player:Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Player;->getPositionSecond()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 68
    .local v0, "pos":I
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment$1;->val$player:Lcom/blank/bm15/model/object/crud/Player;

    iget-object v2, p0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment$1;->val$player:Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/blank/bm15/model/object/crud/Player;->setPositionSecond(Ljava/lang/Integer;)V

    .line 69
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment$1;->val$player:Lcom/blank/bm15/model/object/crud/Player;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/blank/bm15/model/object/crud/Player;->setPositionFirst(Ljava/lang/Integer;)V

    .line 70
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment$1;->val$player:Lcom/blank/bm15/model/object/crud/Player;

    invoke-static {v1}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 72
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment$1;->this$0:Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;->access$0(Lcom/blank/bm15/activity/fragment/PlayerSkillsFragment;)V

    .line 73
    return-void
.end method
