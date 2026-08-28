.class Lcom/blank/bm15/activity/MainActivity$11;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blank/bm15/activity/MainActivity;->deleteGameInThread(Lcom/blank/bm15/model/object/crud/Game;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/blank/bm15/activity/MainActivity;

.field private final synthetic val$game:Lcom/blank/bm15/model/object/crud/Game;


# direct methods
.method constructor <init>(Lcom/blank/bm15/activity/MainActivity;Lcom/blank/bm15/model/object/crud/Game;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/blank/bm15/activity/MainActivity$11;->this$0:Lcom/blank/bm15/activity/MainActivity;

    iput-object p2, p0, Lcom/blank/bm15/activity/MainActivity$11;->val$game:Lcom/blank/bm15/model/object/crud/Game;

    .line 354
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 356
    iget-object v0, p0, Lcom/blank/bm15/activity/MainActivity$11;->val$game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-static {v0}, Lcom/blank/bm15/model/core/Create;->deleteGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 357
    iget-object v0, p0, Lcom/blank/bm15/activity/MainActivity$11;->this$0:Lcom/blank/bm15/activity/MainActivity;

    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/blank/bm15/activity/MainActivity$11;->this$0:Lcom/blank/bm15/activity/MainActivity;

    const-class v3, Lcom/blank/bm15/activity/MainActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Lcom/blank/bm15/activity/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 358
    return-void
.end method
