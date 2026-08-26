.class Lcom/blank/bm15/activity/MainActivity$9$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blank/bm15/activity/MainActivity$9;->onItemLongClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/blank/bm15/activity/MainActivity$9;

.field private final synthetic val$game:Lcom/blank/bm15/model/object/crud/Game;


# direct methods
.method constructor <init>(Lcom/blank/bm15/activity/MainActivity$9;Lcom/blank/bm15/model/object/crud/Game;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/blank/bm15/activity/MainActivity$9$1;->this$1:Lcom/blank/bm15/activity/MainActivity$9;

    iput-object p2, p0, Lcom/blank/bm15/activity/MainActivity$9$1;->val$game:Lcom/blank/bm15/model/object/crud/Game;

    .line 303
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "id"    # I

    .prologue
    .line 305
    iget-object v0, p0, Lcom/blank/bm15/activity/MainActivity$9$1;->this$1:Lcom/blank/bm15/activity/MainActivity$9;

    invoke-static {v0}, Lcom/blank/bm15/activity/MainActivity$9;->access$0(Lcom/blank/bm15/activity/MainActivity$9;)Lcom/blank/bm15/activity/MainActivity;

    move-result-object v0

    iget-object v1, p0, Lcom/blank/bm15/activity/MainActivity$9$1;->val$game:Lcom/blank/bm15/model/object/crud/Game;

    invoke-virtual {v0, v1}, Lcom/blank/bm15/activity/MainActivity;->deleteGameInThread(Lcom/blank/bm15/model/object/crud/Game;)V

    .line 306
    return-void
.end method
