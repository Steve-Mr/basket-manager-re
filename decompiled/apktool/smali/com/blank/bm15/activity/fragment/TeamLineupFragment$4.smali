.class Lcom/blank/bm15/activity/fragment/TeamLineupFragment$4;
.super Ljava/lang/Object;
.source "TeamLineupFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->setTextButton(Lcom/blank/bm15/model/object/crud/Team;Landroid/widget/Button;Ljava/lang/Boolean;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/blank/bm15/activity/fragment/TeamLineupFragment;

.field private final synthetic val$button:Landroid/widget/Button;

.field private final synthetic val$team:Lcom/blank/bm15/model/object/crud/Team;


# direct methods
.method constructor <init>(Lcom/blank/bm15/activity/fragment/TeamLineupFragment;Lcom/blank/bm15/model/object/crud/Team;Landroid/widget/Button;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$4;->this$0:Lcom/blank/bm15/activity/fragment/TeamLineupFragment;

    iput-object p2, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$4;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    iput-object p3, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$4;->val$button:Landroid/widget/Button;

    .line 135
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 138
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$4;->this$0:Lcom/blank/bm15/activity/fragment/TeamLineupFragment;

    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$4;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    iget-object v2, p0, Lcom/blank/bm15/activity/fragment/TeamLineupFragment$4;->val$button:Landroid/widget/Button;

    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-static {v0, v1, v2, v3}, Lcom/blank/bm15/activity/fragment/TeamLineupFragment;->access$1(Lcom/blank/bm15/activity/fragment/TeamLineupFragment;Lcom/blank/bm15/model/object/crud/Team;Landroid/widget/Button;Ljava/lang/Boolean;)V

    .line 139
    return-void
.end method
