.class Lcom/blank/bm15/activity/HomeActivity$15;
.super Ljava/lang/Object;
.source "HomeActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blank/bm15/activity/HomeActivity;->play(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/blank/bm15/activity/HomeActivity;

.field private final synthetic val$matchday:I


# direct methods
.method constructor <init>(Lcom/blank/bm15/activity/HomeActivity;I)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/blank/bm15/activity/HomeActivity$15;->this$0:Lcom/blank/bm15/activity/HomeActivity;

    iput p2, p0, Lcom/blank/bm15/activity/HomeActivity$15;->val$matchday:I

    .line 524
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "id"    # I

    .prologue
    .line 526
    iget-object v0, p0, Lcom/blank/bm15/activity/HomeActivity$15;->this$0:Lcom/blank/bm15/activity/HomeActivity;

    invoke-virtual {v0}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v0

    invoke-static {v0}, Lcom/blank/bm15/model/core/Lineup;->setBetterLineup(Lcom/blank/bm15/model/object/crud/Team;)V

    .line 527
    iget-object v0, p0, Lcom/blank/bm15/activity/HomeActivity$15;->this$0:Lcom/blank/bm15/activity/HomeActivity;

    const-string v1, "AUTO_LINEUP"

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/model/util/BlankPreferences;->setBoolean(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 528
    new-instance v0, Lcom/blank/bm15/model/core/Play;

    iget-object v1, p0, Lcom/blank/bm15/activity/HomeActivity$15;->this$0:Lcom/blank/bm15/activity/HomeActivity;

    invoke-virtual {v1}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v1

    iget v2, p0, Lcom/blank/bm15/activity/HomeActivity$15;->val$matchday:I

    invoke-direct {v0, v1, v2}, Lcom/blank/bm15/model/core/Play;-><init>(Lcom/blank/bm15/model/object/crud/Game;I)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/core/Play;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 529
    return-void
.end method
