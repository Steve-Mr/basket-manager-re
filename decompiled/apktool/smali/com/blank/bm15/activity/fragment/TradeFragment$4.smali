.class Lcom/blank/bm15/activity/fragment/TradeFragment$4;
.super Ljava/lang/Object;
.source "TradeFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blank/bm15/activity/fragment/TradeFragment;->createPage()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

.field private final synthetic val$elementButton3:Landroid/widget/Button;

.field private final synthetic val$findButton:Landroid/widget/Button;


# direct methods
.method constructor <init>(Lcom/blank/bm15/activity/fragment/TradeFragment;Landroid/widget/Button;Landroid/widget/Button;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$4;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    iput-object p2, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$4;->val$elementButton3:Landroid/widget/Button;

    iput-object p3, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$4;->val$findButton:Landroid/widget/Button;

    .line 394
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/blank/bm15/activity/fragment/TradeFragment$4;)Lcom/blank/bm15/activity/fragment/TradeFragment;
    .locals 1

    .prologue
    .line 394
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$4;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 10
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 398
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v5, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$4;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    invoke-static {v5}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v5

    invoke-direct {v0, v5}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 399
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    iget-object v5, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$4;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    invoke-static {v5}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v5

    invoke-virtual {v5}, Lcom/blank/bm15/activity/HomeActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v2

    .line 401
    .local v2, "inflater":Landroid/view/LayoutInflater;
    const v5, 0x7f030006

    const/4 v6, 0x0

    invoke-virtual {v2, v5, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 402
    .local v1, "dialogView":Landroid/view/View;
    const v5, 0x7f0b002f

    invoke-virtual {v1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 403
    .local v4, "textView":Landroid/widget/TextView;
    iget-object v5, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$4;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    invoke-static {v5}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v5

    const v6, 0x7f05017f

    invoke-virtual {v5, v6}, Lcom/blank/bm15/activity/HomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 404
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    iget-object v6, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$4;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    const v7, 0x7f050049

    invoke-virtual {v6, v7}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getString(I)Ljava/lang/String;

    move-result-object v6

    new-instance v7, Lcom/blank/bm15/activity/fragment/TradeFragment$4$1;

    iget-object v8, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$4;->val$elementButton3:Landroid/widget/Button;

    iget-object v9, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$4;->val$findButton:Landroid/widget/Button;

    invoke-direct {v7, p0, v8, v9}, Lcom/blank/bm15/activity/fragment/TradeFragment$4$1;-><init>(Lcom/blank/bm15/activity/fragment/TradeFragment$4;Landroid/widget/Button;Landroid/widget/Button;)V

    invoke-virtual {v5, v6, v7}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    .line 432
    iget-object v6, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$4;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    const v7, 0x7f050048

    invoke-virtual {v6, v7}, Lcom/blank/bm15/activity/fragment/TradeFragment;->getString(I)Ljava/lang/String;

    move-result-object v6

    new-instance v7, Lcom/blank/bm15/activity/fragment/TradeFragment$4$2;

    invoke-direct {v7, p0}, Lcom/blank/bm15/activity/fragment/TradeFragment$4$2;-><init>(Lcom/blank/bm15/activity/fragment/TradeFragment$4;)V

    invoke-virtual {v5, v6, v7}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 438
    const v5, 0x7f0b0030

    invoke-virtual {v1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ListView;

    .line 439
    .local v3, "listView":Landroid/widget/ListView;
    iget-object v5, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$4;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    invoke-static {v5}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$9(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 440
    new-instance v5, Lcom/blank/bm15/activity/fragment/TradeFragment$4$3;

    iget-object v6, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$4;->val$elementButton3:Landroid/widget/Button;

    iget-object v7, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$4;->val$findButton:Landroid/widget/Button;

    invoke-direct {v5, p0, v3, v6, v7}, Lcom/blank/bm15/activity/fragment/TradeFragment$4$3;-><init>(Lcom/blank/bm15/activity/fragment/TradeFragment$4;Landroid/widget/ListView;Landroid/widget/Button;Landroid/widget/Button;)V

    invoke-virtual {v3, v5}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 493
    iget-object v5, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$4;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    invoke-static {v5}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v5

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v6

    iput-object v6, v5, Lcom/blank/bm15/activity/HomeActivity;->alertDialog:Landroid/app/AlertDialog;

    .line 494
    iget-object v5, p0, Lcom/blank/bm15/activity/fragment/TradeFragment$4;->this$0:Lcom/blank/bm15/activity/fragment/TradeFragment;

    invoke-static {v5}, Lcom/blank/bm15/activity/fragment/TradeFragment;->access$0(Lcom/blank/bm15/activity/fragment/TradeFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v5

    iget-object v5, v5, Lcom/blank/bm15/activity/HomeActivity;->alertDialog:Landroid/app/AlertDialog;

    invoke-virtual {v5}, Landroid/app/AlertDialog;->show()V

    .line 495
    return-void
.end method
