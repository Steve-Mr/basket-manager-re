.class Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2;
.super Ljava/lang/Object;
.source "TeamSquadFragment.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->createPage()V
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
.field final synthetic this$0:Lcom/blank/bm15/activity/fragment/TeamSquadFragment;

.field private final synthetic val$listView:Landroid/widget/ListView;

.field private final synthetic val$team:Lcom/blank/bm15/model/object/crud/Team;


# direct methods
.method constructor <init>(Lcom/blank/bm15/activity/fragment/TeamSquadFragment;Landroid/widget/ListView;Lcom/blank/bm15/model/object/crud/Team;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2;->this$0:Lcom/blank/bm15/activity/fragment/TeamSquadFragment;

    iput-object p2, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2;->val$listView:Landroid/widget/ListView;

    iput-object p3, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    .line 82
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2;)Lcom/blank/bm15/activity/fragment/TeamSquadFragment;
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2;->this$0:Lcom/blank/bm15/activity/fragment/TeamSquadFragment;

    return-object v0
.end method


# virtual methods
.method public onItemLongClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)Z
    .locals 12
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
    .line 85
    .local p1, "arg0":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2;->val$listView:Landroid/widget/ListView;

    invoke-virtual {v0, p3}, Landroid/widget/ListView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/blank/bm15/model/object/crud/Player;

    .line 86
    .local v5, "selectedPlayer":Lcom/blank/bm15/model/object/crud/Player;
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getPositionMatch()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v7

    .line 87
    .local v7, "selectedPlayerMatchPosition":I
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getIsInLineup()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    .line 88
    .local v3, "selectedPlayerIsInLineup":Z
    invoke-virtual {v5}, Lcom/blank/bm15/model/object/crud/Player;->getIsTitular()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    .line 90
    .local v6, "selectedPlayerIsTitular":Z
    new-instance v8, Landroid/app/AlertDialog$Builder;

    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2;->this$0:Lcom/blank/bm15/activity/fragment/TeamSquadFragment;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->access$0(Lcom/blank/bm15/activity/fragment/TeamSquadFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v0

    invoke-direct {v8, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 91
    .local v8, "builder":Landroid/app/AlertDialog$Builder;
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2;->this$0:Lcom/blank/bm15/activity/fragment/TeamSquadFragment;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->access$0(Lcom/blank/bm15/activity/fragment/TeamSquadFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/blank/bm15/activity/HomeActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v10

    .line 93
    .local v10, "inflater":Landroid/view/LayoutInflater;
    const v0, 0x7f030006

    const/4 v1, 0x0

    invoke-virtual {v10, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v9

    .line 94
    .local v9, "dialogView":Landroid/view/View;
    const v0, 0x7f0b002f

    invoke-virtual {v9, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v11

    check-cast v11, Landroid/widget/TextView;

    .line 95
    .local v11, "title":Landroid/widget/TextView;
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2;->this$0:Lcom/blank/bm15/activity/fragment/TeamSquadFragment;

    const v1, 0x7f0500bb

    invoke-virtual {v0, v1}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v11, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 96
    invoke-virtual {v8, v9}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 97
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2;->this$0:Lcom/blank/bm15/activity/fragment/TeamSquadFragment;

    const v4, 0x7f050048

    invoke-virtual {v1, v4}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v4, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2$1;

    invoke-direct {v4, p0}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2$1;-><init>(Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2;)V

    invoke-virtual {v0, v1, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 102
    if-eqz v3, :cond_0

    .line 103
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2;->this$0:Lcom/blank/bm15/activity/fragment/TeamSquadFragment;

    const v1, 0x7f050049

    invoke-virtual {v0, v1}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2$2;

    iget-object v4, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    invoke-direct {v1, p0, v6, v4, v7}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2$2;-><init>(Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2;ZLcom/blank/bm15/model/object/crud/Team;I)V

    invoke-virtual {v8, v0, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 116
    :cond_0
    const v0, 0x7f0b0030

    invoke-virtual {v9, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ListView;

    .line 117
    .local v2, "listView":Landroid/widget/ListView;
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2;->this$0:Lcom/blank/bm15/activity/fragment/TeamSquadFragment;

    invoke-static {v0, v5}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->access$2(Lcom/blank/bm15/activity/fragment/TeamSquadFragment;Lcom/blank/bm15/model/object/crud/Player;)Lcom/blank/bm15/activity/adapter/SeparatedListAdapter;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 118
    new-instance v0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2$3;

    iget-object v4, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2;->val$team:Lcom/blank/bm15/model/object/crud/Team;

    move-object v1, p0

    invoke-direct/range {v0 .. v7}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2$3;-><init>(Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2;Landroid/widget/ListView;ZLcom/blank/bm15/model/object/crud/Team;Lcom/blank/bm15/model/object/crud/Player;ZI)V

    invoke-virtual {v2, v0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 168
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2;->this$0:Lcom/blank/bm15/activity/fragment/TeamSquadFragment;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->access$0(Lcom/blank/bm15/activity/fragment/TeamSquadFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v0

    invoke-virtual {v8}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    iput-object v1, v0, Lcom/blank/bm15/activity/HomeActivity;->alertDialog:Landroid/app/AlertDialog;

    .line 169
    iget-object v0, p0, Lcom/blank/bm15/activity/fragment/TeamSquadFragment$2;->this$0:Lcom/blank/bm15/activity/fragment/TeamSquadFragment;

    invoke-static {v0}, Lcom/blank/bm15/activity/fragment/TeamSquadFragment;->access$0(Lcom/blank/bm15/activity/fragment/TeamSquadFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v0

    iget-object v0, v0, Lcom/blank/bm15/activity/HomeActivity;->alertDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 171
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method
