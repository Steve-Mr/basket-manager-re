.class Lcom/blank/bm15/activity/HomeActivity$11;
.super Ljava/lang/Object;
.source "HomeActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blank/bm15/activity/HomeActivity;->validatePlay()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/blank/bm15/activity/HomeActivity;


# direct methods
.method constructor <init>(Lcom/blank/bm15/activity/HomeActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/blank/bm15/activity/HomeActivity$11;->this$0:Lcom/blank/bm15/activity/HomeActivity;

    .line 281
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "id"    # I

    .prologue
    .line 283
    invoke-interface {p1}, Landroid/content/DialogInterface;->cancel()V

    .line 284
    iget-object v0, p0, Lcom/blank/bm15/activity/HomeActivity$11;->this$0:Lcom/blank/bm15/activity/HomeActivity;

    new-instance v1, Lcom/blank/bm15/model/core/Play;

    iget-object v2, p0, Lcom/blank/bm15/activity/HomeActivity$11;->this$0:Lcom/blank/bm15/activity/HomeActivity;

    invoke-virtual {v2}, Lcom/blank/bm15/activity/HomeActivity;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/blank/bm15/model/core/Play;-><init>(Lcom/blank/bm15/model/object/crud/Game;)V

    invoke-static {v0, v1}, Lcom/blank/bm15/activity/HomeActivity;->access$1(Lcom/blank/bm15/activity/HomeActivity;Lcom/blank/bm15/model/core/Play;)V

    .line 285
    iget-object v0, p0, Lcom/blank/bm15/activity/HomeActivity$11;->this$0:Lcom/blank/bm15/activity/HomeActivity;

    invoke-static {v0}, Lcom/blank/bm15/activity/HomeActivity;->access$2(Lcom/blank/bm15/activity/HomeActivity;)Lcom/blank/bm15/model/core/Play;

    move-result-object v0

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/blank/bm15/model/core/Play;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 286
    return-void
.end method
