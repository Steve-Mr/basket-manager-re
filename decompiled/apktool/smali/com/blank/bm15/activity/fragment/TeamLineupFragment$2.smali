.class Lcom/blank/bm15/activity/fragment/TeamLineupFragment$2;
.super Ljava/lang/Object;
.source "TeamLineupFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->createPage()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/blank/bm15/activity/fragment/TeamLineupFragment;

.field private final synthetic val$team:Lcom/blank/bm15/model/object/crud/Team;


# direct methods
.method constructor <init>(Lcom/blank/bm15/activity/fragment/TeamLineupFragment;Lcom/blank/bm15/model/object/crud/Team;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$2;->this$0:Lcom/blank/bm15/activity/fragment/TeamLineupFragment;

    iput-object p2, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$2;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    .line 110
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 113
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$2;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-static {v0, v1}, Lcom/blank/bm15/model/core/Lineup;->removeAll(Lcom/blank/bm15/model/object/crud/Team;Ljava/lang/Boolean;)V

    .line 114
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$2;->this$0:Lcom/blank/bm15/activity/fragment/TeamLineupFragment;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->access$0(Lcom/blank/bm15/activity/fragment/TeamLineupFragment;)V

    .line 115
    return-void
.end method
