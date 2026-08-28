.class Lcom/blank/bm15/activity/MainActivity$9;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blank/bm15/activity/MainActivity;->createPage()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/widget/AdapterView$OnItemLongClickListener;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/blank/bm15/activity/MainActivity;

.field private final synthetic val$listView:Landroid/widget/ListView;


# direct methods
.method constructor <init>(Lcom/blank/bm15/activity/MainActivity;Landroid/widget/ListView;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/blank/bm15/activity/MainActivity$9;->this$0:Lcom/blank/bm15/activity/MainActivity;

    iput-object p2, p0, Lcom/blank/bm15/activity/MainActivity$9;->val$listView:Landroid/widget/ListView;

    .line 294
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/blank/bm15/activity/MainActivity$9;)Lcom/blank/bm15/activity/MainActivity;
    .locals 1

    .prologue
    .line 294
    iget-object v0, p0, Lcom/blank/bm15/activity/MainActivity$9;->this$0:Lcom/blank/bm15/activity/MainActivity;

    return-object v0
.end method


# virtual methods
.method public onItemLongClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)Z
    .locals 5
    .param p2, "arg1"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "arg3"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)Z"
        }
    .end annotation

    .prologue
    .line 297
    .local p1, "arg0":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v2, p0, Lcom/blank/bm15/activity/MainActivity$9;->val$listView:Landroid/widget/ListView;

    invoke-virtual {v2, p3}, Landroid/widget/ListView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/blank/bm15/model/object/crud/Game;

    .line 298
    .local v1, "game":Lcom/blank/bm15/model/object/crud/Game;
    iget-object v2, p0, Lcom/blank/bm15/activity/MainActivity$9;->this$0:Lcom/blank/bm15/activity/MainActivity;

    invoke-static {v2}, Lcom/blank/bm15/model/util/Alert;->getBuilder(Landroid/app/Activity;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 299
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    iget-object v2, p0, Lcom/blank/bm15/activity/MainActivity$9;->this$0:Lcom/blank/bm15/activity/MainActivity;

    const v3, 0x7f05006a

    invoke-virtual {v2, v3}, Lcom/blank/bm15/activity/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 300
    iget-object v3, p0, Lcom/blank/bm15/activity/MainActivity$9;->this$0:Lcom/blank/bm15/activity/MainActivity;

    const v4, 0x7f05006c

    invoke-virtual {v3, v4}, Lcom/blank/bm15/activity/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 301
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 302
    const v3, 0x7f020036

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 303
    iget-object v3, p0, Lcom/blank/bm15/activity/MainActivity$9;->this$0:Lcom/blank/bm15/activity/MainActivity;

    const v4, 0x7f050047

    invoke-virtual {v3, v4}, Lcom/blank/bm15/activity/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Lcom/blank/bm15/activity/MainActivity$9$1;

    invoke-direct {v4, p0, v1}, Lcom/blank/bm15/activity/MainActivity$9$1;-><init>(Lcom/blank/bm15/activity/MainActivity$9;Lcom/blank/bm15/model/object/crud/Game;)V

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 307
    iget-object v3, p0, Lcom/blank/bm15/activity/MainActivity$9;->this$0:Lcom/blank/bm15/activity/MainActivity;

    const v4, 0x7f050048

    invoke-virtual {v3, v4}, Lcom/blank/bm15/activity/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Lcom/blank/bm15/activity/MainActivity$9$2;

    invoke-direct {v4, p0}, Lcom/blank/bm15/activity/MainActivity$9$2;-><init>(Lcom/blank/bm15/activity/MainActivity$9;)V

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 312
    iget-object v2, p0, Lcom/blank/bm15/activity/MainActivity$9;->this$0:Lcom/blank/bm15/activity/MainActivity;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v3

    iput-object v3, v2, Lcom/blank/bm15/activity/MainActivity;->alertDialog:Landroid/app/AlertDialog;

    .line 313
    iget-object v2, p0, Lcom/blank/bm15/activity/MainActivity$9;->this$0:Lcom/blank/bm15/activity/MainActivity;

    iget-object v2, v2, Lcom/blank/bm15/activity/MainActivity;->alertDialog:Landroid/app/AlertDialog;

    invoke-virtual {v2}, Landroid/app/AlertDialog;->show()V

    .line 314
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    return v2
.end method
