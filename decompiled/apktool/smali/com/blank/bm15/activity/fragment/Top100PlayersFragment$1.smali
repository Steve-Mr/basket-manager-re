.class Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1;
.super Ljava/lang/Object;
.source "Top100PlayersFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;->create()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;


# direct methods
.method constructor <init>(Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1;->this$0:Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1;)Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;
    .locals 1

    .prologue
    .line 67
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1;->this$0:Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 10
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 70
    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v7, p0, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1;->this$0:Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;

    invoke-static {v7}, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;->access$0(Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v7

    invoke-direct {v1, v7}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 71
    .local v1, "builder":Landroid/app/AlertDialog$Builder;
    iget-object v7, p0, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1;->this$0:Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;

    invoke-static {v7}, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;->access$0(Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v7

    invoke-virtual {v7}, Lcom/blank/bm15/activity/HomeActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v3

    .line 73
    .local v3, "inflater":Landroid/view/LayoutInflater;
    const v7, 0x7f030006

    const/4 v8, 0x0

    invoke-virtual {v3, v7, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 74
    .local v2, "dialogView":Landroid/view/View;
    const v7, 0x7f0b002f

    invoke-virtual {v2, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    .line 75
    .local v6, "title":Landroid/widget/TextView;
    iget-object v7, p0, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1;->this$0:Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;

    const v8, 0x7f050052

    invoke-virtual {v7, v8}, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 76
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    .line 77
    iget-object v8, p0, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1;->this$0:Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;

    const v9, 0x7f050049

    invoke-virtual {v8, v9}, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;->getString(I)Ljava/lang/String;

    move-result-object v8

    new-instance v9, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1$1;

    invoke-direct {v9, p0}, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1$1;-><init>(Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1;)V

    invoke-virtual {v7, v8, v9}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    .line 83
    iget-object v8, p0, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1;->this$0:Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;

    const v9, 0x7f050048

    invoke-virtual {v8, v9}, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;->getString(I)Ljava/lang/String;

    move-result-object v8

    new-instance v9, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1$2;

    invoke-direct {v9, p0}, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1$2;-><init>(Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1;)V

    invoke-virtual {v7, v8, v9}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 89
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 90
    .local v5, "orderTypes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v7, p0, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1;->this$0:Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;

    const v8, 0x7f050040

    invoke-virtual {v7, v8}, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 91
    iget-object v7, p0, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1;->this$0:Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;

    const v8, 0x7f050041

    invoke-virtual {v7, v8}, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 92
    iget-object v7, p0, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1;->this$0:Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;

    const v8, 0x7f050042

    invoke-virtual {v7, v8}, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 93
    iget-object v7, p0, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1;->this$0:Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;

    const v8, 0x7f050043

    invoke-virtual {v7, v8}, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 94
    iget-object v7, p0, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1;->this$0:Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;

    const v8, 0x7f050044

    invoke-virtual {v7, v8}, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 96
    const v7, 0x7f0b0030

    invoke-virtual {v2, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ListView;

    .line 97
    .local v4, "listView":Landroid/widget/ListView;
    new-instance v0, Landroid/widget/ArrayAdapter;

    iget-object v7, p0, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1;->this$0:Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;

    invoke-static {v7}, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;->access$0(Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v7

    const v8, 0x1090003

    invoke-direct {v0, v7, v8, v5}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 98
    .local v0, "adapter":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Ljava/lang/String;>;"
    invoke-virtual {v4, v0}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 99
    new-instance v7, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1$3;

    invoke-direct {v7, p0}, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1$3;-><init>(Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1;)V

    invoke-virtual {v4, v7}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 109
    iget-object v7, p0, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1;->this$0:Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;

    invoke-static {v7}, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;->access$0(Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v7

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v8

    iput-object v8, v7, Lcom/blank/bm15/activity/HomeActivity;->alertDialog:Landroid/app/AlertDialog;

    .line 110
    iget-object v7, p0, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment$1;->this$0:Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;

    invoke-static {v7}, Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;->access$0(Lcom/blank/bm15/activity/fragment/Top100PlayersFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v7

    iget-object v7, v7, Lcom/blank/bm15/activity/HomeActivity;->alertDialog:Landroid/app/AlertDialog;

    invoke-virtual {v7}, Landroid/app/AlertDialog;->show()V

    .line 111
    return-void
.end method
