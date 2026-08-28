.class Lcom/blank/bm15/activity/MainActivity$12;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blank/bm15/activity/MainActivity;->showToastError()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/blank/bm15/activity/MainActivity;


# direct methods
.method constructor <init>(Lcom/blank/bm15/activity/MainActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/blank/bm15/activity/MainActivity$12;->this$0:Lcom/blank/bm15/activity/MainActivity;

    .line 395
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 398
    iget-object v1, p0, Lcom/blank/bm15/activity/MainActivity$12;->this$0:Lcom/blank/bm15/activity/MainActivity;

    iget-object v2, p0, Lcom/blank/bm15/activity/MainActivity$12;->this$0:Lcom/blank/bm15/activity/MainActivity;

    const v3, 0x7f05007d

    invoke-virtual {v2, v3}, Lcom/blank/bm15/activity/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 399
    .local v0, "toast":Landroid/widget/Toast;
    const/16 v1, 0x11

    invoke-virtual {v0, v1, v4, v4}, Landroid/widget/Toast;->setGravity(III)V

    .line 400
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 401
    return-void
.end method
