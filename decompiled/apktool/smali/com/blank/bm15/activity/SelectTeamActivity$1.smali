.class Lcom/blank/bm15/activity/SelectTeamActivity$1;
.super Ljava/lang/Object;
.source "SelectTeamActivity.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blank/bm15/activity/SelectTeamActivity;->createPage()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/widget/AdapterView$OnItemClickListener;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/blank/bm15/activity/SelectTeamActivity;

.field private final synthetic val$listView:Landroid/widget/ListView;


# direct methods
.method constructor <init>(Lcom/blank/bm15/activity/SelectTeamActivity;Landroid/widget/ListView;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/blank/bm15/activity/SelectTeamActivity$1;->this$0:Lcom/blank/bm15/activity/SelectTeamActivity;

    iput-object p2, p0, Lcom/blank/bm15/activity/SelectTeamActivity$1;->val$listView:Landroid/widget/ListView;

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/blank/bm15/activity/SelectTeamActivity$1;)Lcom/blank/bm15/activity/SelectTeamActivity;
    .locals 1

    .prologue
    .line 50
    iget-object v0, p0, Lcom/blank/bm15/activity/SelectTeamActivity$1;->this$0:Lcom/blank/bm15/activity/SelectTeamActivity;

    return-object v0
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 11
    .param p2, "arg1"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "arg3"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 53
    .local p1, "arg0":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v7, p0, Lcom/blank/bm15/activity/SelectTeamActivity$1;->val$listView:Landroid/widget/ListView;

    invoke-virtual {v7, p3}, Landroid/widget/ListView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/blank/bm15/model/object/crud/Team;

    .line 55
    .local v5, "team":Lcom/blank/bm15/model/object/crud/Team;
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v7, p0, Lcom/blank/bm15/activity/SelectTeamActivity$1;->this$0:Lcom/blank/bm15/activity/SelectTeamActivity;

    invoke-direct {v0, v7}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 56
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    iget-object v7, p0, Lcom/blank/bm15/activity/SelectTeamActivity$1;->this$0:Lcom/blank/bm15/activity/SelectTeamActivity;

    invoke-virtual {v7}, Lcom/blank/bm15/activity/SelectTeamActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v2

    .line 58
    .local v2, "inflater":Landroid/view/LayoutInflater;
    const v7, 0x7f030006

    const/4 v8, 0x0

    invoke-virtual {v2, v7, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 59
    .local v1, "dialogView":Landroid/view/View;
    const v7, 0x7f0b002f

    invoke-virtual {v1, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    .line 60
    .local v6, "textView":Landroid/widget/TextView;
    iget-object v7, p0, Lcom/blank/bm15/activity/SelectTeamActivity$1;->this$0:Lcom/blank/bm15/activity/SelectTeamActivity;

    const v8, 0x7f050095

    invoke-virtual {v7, v8}, Lcom/blank/bm15/activity/SelectTeamActivity;->getString(I)Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Team;->getFullName()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    iget-object v7, p0, Lcom/blank/bm15/activity/SelectTeamActivity$1;->this$0:Lcom/blank/bm15/activity/SelectTeamActivity;

    invoke-virtual {v7}, Lcom/blank/bm15/activity/SelectTeamActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-static {v5}, Lcom/blank/bm15/model/util/Util;->getTeamColor(Lcom/blank/bm15/model/object/crud/Team;)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getColor(I)I

    move-result v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setBackgroundColor(I)V

    .line 63
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    .line 64
    iget-object v8, p0, Lcom/blank/bm15/activity/SelectTeamActivity$1;->this$0:Lcom/blank/bm15/activity/SelectTeamActivity;

    const v9, 0x7f050047

    invoke-virtual {v8, v9}, Lcom/blank/bm15/activity/SelectTeamActivity;->getString(I)Ljava/lang/String;

    move-result-object v8

    new-instance v9, Lcom/blank/bm15/activity/SelectTeamActivity$1$1;

    invoke-direct {v9, p0, v5}, Lcom/blank/bm15/activity/SelectTeamActivity$1$1;-><init>(Lcom/blank/bm15/activity/SelectTeamActivity$1;Lcom/blank/bm15/model/object/crud/Team;)V

    invoke-virtual {v7, v8, v9}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    .line 71
    iget-object v8, p0, Lcom/blank/bm15/activity/SelectTeamActivity$1;->this$0:Lcom/blank/bm15/activity/SelectTeamActivity;

    const v9, 0x7f050048

    invoke-virtual {v8, v9}, Lcom/blank/bm15/activity/SelectTeamActivity;->getString(I)Ljava/lang/String;

    move-result-object v8

    new-instance v9, Lcom/blank/bm15/activity/SelectTeamActivity$1$2;

    invoke-direct {v9, p0}, Lcom/blank/bm15/activity/SelectTeamActivity$1$2;-><init>(Lcom/blank/bm15/activity/SelectTeamActivity$1;)V

    invoke-virtual {v7, v8, v9}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 77
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Team;->getTactic()Lcom/blank/bm15/model/object/crud/Tactic;

    move-result-object v7

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/Tactic;->getPlayers()Ljava/util/List;

    move-result-object v4

    .line 78
    .local v4, "players":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    new-instance v7, Lcom/blank/bm15/model/comparator/PlayerComparator;

    const/4 v8, 0x1

    const/4 v9, -0x1

    invoke-direct {v7, v8, v9}, Lcom/blank/bm15/model/comparator/PlayerComparator;-><init>(II)V

    invoke-static {v4, v7}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 79
    const v7, 0x7f0b0030

    invoke-virtual {v1, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ListView;

    .line 80
    .local v3, "listView":Landroid/widget/ListView;
    new-instance v7, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;

    iget-object v8, p0, Lcom/blank/bm15/activity/SelectTeamActivity$1;->this$0:Lcom/blank/bm15/activity/SelectTeamActivity;

    const v9, 0x7f03001f

    sget-object v10, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v10}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v10

    invoke-direct {v7, v8, v9, v4, v10}, Lcom/blank/bm15/activity/adapter/AdapterPlayerList;-><init>(Landroid/content/Context;ILjava/util/List;Z)V

    invoke-virtual {v3, v7}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 82
    iget-object v7, p0, Lcom/blank/bm15/activity/SelectTeamActivity$1;->this$0:Lcom/blank/bm15/activity/SelectTeamActivity;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/blank/bm15/activity/SelectTeamActivity;->access$0(Lcom/blank/bm15/activity/SelectTeamActivity;Landroid/app/AlertDialog;)V

    .line 83
    iget-object v7, p0, Lcom/blank/bm15/activity/SelectTeamActivity$1;->this$0:Lcom/blank/bm15/activity/SelectTeamActivity;

    invoke-static {v7}, Lcom/blank/bm15/activity/SelectTeamActivity;->access$1(Lcom/blank/bm15/activity/SelectTeamActivity;)Landroid/app/AlertDialog;

    move-result-object v7

    invoke-virtual {v7}, Landroid/app/AlertDialog;->show()V

    .line 84
    return-void
.end method
