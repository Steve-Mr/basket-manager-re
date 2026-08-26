.class Lcom/blank/bm15/activity/MainActivity$10;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blank/bm15/activity/MainActivity;->createGameInThread(Ljava/lang/String;Ljava/io/InputStream;Ljava/net/URL;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/blank/bm15/activity/MainActivity;

.field private final synthetic val$is:Ljava/io/InputStream;

.field private final synthetic val$name:Ljava/lang/String;

.field private final synthetic val$url:Ljava/net/URL;


# direct methods
.method constructor <init>(Lcom/blank/bm15/activity/MainActivity;Ljava/io/InputStream;Ljava/net/URL;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/blank/bm15/activity/MainActivity$10;->this$0:Lcom/blank/bm15/activity/MainActivity;

    iput-object p2, p0, Lcom/blank/bm15/activity/MainActivity$10;->val$is:Ljava/io/InputStream;

    iput-object p3, p0, Lcom/blank/bm15/activity/MainActivity$10;->val$url:Ljava/net/URL;

    iput-object p4, p0, Lcom/blank/bm15/activity/MainActivity$10;->val$name:Ljava/lang/String;

    .line 323
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    .line 325
    iget-object v2, p0, Lcom/blank/bm15/activity/MainActivity$10;->val$is:Ljava/io/InputStream;

    .line 326
    .local v2, "inputStream":Ljava/io/InputStream;
    if-nez v2, :cond_0

    iget-object v3, p0, Lcom/blank/bm15/activity/MainActivity$10;->val$url:Ljava/net/URL;

    if-eqz v3, :cond_0

    .line 328
    :try_start_0
    iget-object v3, p0, Lcom/blank/bm15/activity/MainActivity$10;->val$url:Ljava/net/URL;

    invoke-virtual {v3}, Ljava/net/URL;->openStream()Ljava/io/InputStream;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 334
    :cond_0
    :goto_0
    iget-object v3, p0, Lcom/blank/bm15/activity/MainActivity$10;->this$0:Lcom/blank/bm15/activity/MainActivity;

    iget-object v4, p0, Lcom/blank/bm15/activity/MainActivity$10;->val$name:Ljava/lang/String;

    invoke-static {v3, v4, v2}, Lcom/blank/bm15/model/core/Create;->newGame(Landroid/app/Activity;Ljava/lang/String;Ljava/io/InputStream;)Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v1

    .line 335
    .local v1, "game":Lcom/blank/bm15/model/object/crud/Game;
    iget-object v3, p0, Lcom/blank/bm15/activity/MainActivity$10;->this$0:Lcom/blank/bm15/activity/MainActivity;

    invoke-virtual {v3, v1}, Lcom/blank/bm15/activity/MainActivity;->setGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 337
    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Game;->getCreateOnlinePlayersOk()Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-nez v3, :cond_1

    .line 338
    invoke-static {v1}, Lcom/blank/bm15/model/core/Create;->deleteGame(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 339
    iget-object v3, p0, Lcom/blank/bm15/activity/MainActivity$10;->this$0:Lcom/blank/bm15/activity/MainActivity;

    invoke-virtual {v3}, Lcom/blank/bm15/activity/MainActivity;->showToastError()V

    .line 340
    iget-object v3, p0, Lcom/blank/bm15/activity/MainActivity$10;->this$0:Lcom/blank/bm15/activity/MainActivity;

    new-instance v4, Landroid/content/Intent;

    iget-object v5, p0, Lcom/blank/bm15/activity/MainActivity$10;->this$0:Lcom/blank/bm15/activity/MainActivity;

    const-class v6, Lcom/blank/bm15/activity/MainActivity;

    invoke-direct {v4, v5, v6}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v3, v4}, Lcom/blank/bm15/activity/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 346
    :goto_1
    return-void

    .line 329
    .end local v1    # "game":Lcom/blank/bm15/model/object/crud/Game;
    :catch_0
    move-exception v0

    .line 330
    .local v0, "e":Ljava/lang/Exception;
    const-string v3, "MainActivity"

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 342
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v1    # "game":Lcom/blank/bm15/model/object/crud/Game;
    :cond_1
    iget-object v3, p0, Lcom/blank/bm15/activity/MainActivity$10;->this$0:Lcom/blank/bm15/activity/MainActivity;

    const-string v4, "GAME_ID"

    invoke-virtual {v1}, Lcom/blank/bm15/model/object/crud/Game;->getId()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-static {v3, v4, v5}, Lcom/blank/bm15/dao/utils/BlankSharedPreferences;->setInt(Landroid/content/Context;Ljava/lang/String;I)V

    .line 343
    iget-object v3, p0, Lcom/blank/bm15/activity/MainActivity$10;->this$0:Lcom/blank/bm15/activity/MainActivity;

    const/16 v4, 0xf

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x0

    invoke-static {v3, v4, v5}, Lcom/blank/bm15/activity/base/BaseActivity;->resetNavigation(Landroid/content/Context;Ljava/lang/Integer;Ljava/lang/Integer;)V

    .line 344
    iget-object v3, p0, Lcom/blank/bm15/activity/MainActivity$10;->this$0:Lcom/blank/bm15/activity/MainActivity;

    new-instance v4, Landroid/content/Intent;

    iget-object v5, p0, Lcom/blank/bm15/activity/MainActivity$10;->this$0:Lcom/blank/bm15/activity/MainActivity;

    const-class v6, Lcom/blank/bm15/activity/SelectTeamActivity;

    invoke-direct {v4, v5, v6}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v3, v4}, Lcom/blank/bm15/activity/MainActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_1
.end method
