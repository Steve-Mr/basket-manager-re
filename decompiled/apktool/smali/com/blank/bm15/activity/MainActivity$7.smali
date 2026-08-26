.class Lcom/blank/bm15/activity/MainActivity$7;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blank/bm15/activity/MainActivity;->onChoseFileCreateDialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/blank/bm15/activity/MainActivity;

.field private final synthetic val$sdCardDir:Ljava/io/File;


# direct methods
.method constructor <init>(Lcom/blank/bm15/activity/MainActivity;Ljava/io/File;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/blank/bm15/activity/MainActivity$7;->this$0:Lcom/blank/bm15/activity/MainActivity;

    iput-object p2, p0, Lcom/blank/bm15/activity/MainActivity$7;->val$sdCardDir:Ljava/io/File;

    .line 261
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 263
    iget-object v0, p0, Lcom/blank/bm15/activity/MainActivity$7;->this$0:Lcom/blank/bm15/activity/MainActivity;

    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lcom/blank/bm15/activity/MainActivity$7;->val$sdCardDir:Ljava/io/File;

    iget-object v3, p0, Lcom/blank/bm15/activity/MainActivity$7;->this$0:Lcom/blank/bm15/activity/MainActivity;

    invoke-static {v3}, Lcom/blank/bm15/activity/MainActivity;->access$3(Lcom/blank/bm15/activity/MainActivity;)[Ljava/lang/String;

    move-result-object v3

    aget-object v3, v3, p2

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v0, v1}, Lcom/blank/bm15/activity/MainActivity;->access$4(Lcom/blank/bm15/activity/MainActivity;Ljava/io/File;)V

    .line 264
    iget-object v0, p0, Lcom/blank/bm15/activity/MainActivity$7;->this$0:Lcom/blank/bm15/activity/MainActivity;

    invoke-static {v0}, Lcom/blank/bm15/activity/MainActivity;->access$1(Lcom/blank/bm15/activity/MainActivity;)Landroid/widget/EditText;

    move-result-object v0

    iget-object v1, p0, Lcom/blank/bm15/activity/MainActivity$7;->this$0:Lcom/blank/bm15/activity/MainActivity;

    invoke-static {v1}, Lcom/blank/bm15/activity/MainActivity;->access$3(Lcom/blank/bm15/activity/MainActivity;)[Ljava/lang/String;

    move-result-object v1

    aget-object v1, v1, p2

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 265
    return-void
.end method
