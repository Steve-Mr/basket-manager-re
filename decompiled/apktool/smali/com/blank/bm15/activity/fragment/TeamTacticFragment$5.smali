.class Lcom/blank/bm15/activity/fragment/TeamTacticFragment$5;
.super Ljava/lang/Object;
.source "TeamTacticFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blank/bm15/activity/fragment/TeamTacticFragment;->setTextButton(Lcom/blank/bm15/model/object/crud/Team;Landroid/widget/Button;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/blank/bm15/activity/fragment/TeamTacticFragment;

.field private final synthetic val$button:Landroid/widget/Button;


# direct methods
.method constructor <init>(Lcom/blank/bm15/activity/fragment/TeamTacticFragment;Landroid/widget/Button;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$5;->this$0:Lcom/blank/bm15/activity/fragment/TeamTacticFragment;

    iput-object p2, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$5;->val$button:Landroid/widget/Button;

    .line 156
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 159
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$5;->this$0:Lcom/blank/bm15/activity/fragment/TeamTacticFragment;

    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TeamTacticFragment$5;->val$button:Landroid/widget/Button;

    invoke-static {v0, v1}, Lcom/blank/bm15/activity/fragment/TeamTacticFragment;->access$0(Lcom/blank/bm15/activity/fragment/TeamTacticFragment;Landroid/widget/Button;)V

    .line 160
    return-void
.end method
