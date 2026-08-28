.class Lcom/blank/bm15/activity/HomeActivity$6;
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
    iput-object p1, p0, Lcom/blank/bm15/activity/HomeActivity$6;->this$0:Lcom/blank/bm15/activity/HomeActivity;

    .line 197
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "id"    # I

    .prologue
    .line 199
    iget-object v0, p0, Lcom/blank/bm15/activity/HomeActivity$6;->this$0:Lcom/blank/bm15/activity/HomeActivity;

    const/16 v1, 0x15

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/blank/bm15/activity/base/BaseActivity;->addNavigation(Landroid/content/Context;Ljava/lang/Integer;Ljava/lang/Integer;)V

    .line 200
    iget-object v0, p0, Lcom/blank/bm15/activity/HomeActivity$6;->this$0:Lcom/blank/bm15/activity/HomeActivity;

    invoke-static {v0}, Lcom/blank/bm15/activity/HomeActivity;->access$0(Lcom/blank/bm15/activity/HomeActivity;)V

    .line 201
    return-void
.end method
