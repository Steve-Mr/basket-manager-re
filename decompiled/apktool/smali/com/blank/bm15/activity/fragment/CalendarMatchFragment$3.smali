.class Lcom/blank/bm15/activity/fragment/CalendarMatchFragment$3;
.super Ljava/lang/Object;
.source "CalendarMatchFragment.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;->createPage()V
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
.field final synthetic this$0:Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;

.field private final synthetic val$calendarListView:Landroid/widget/ListView;


# direct methods
.method constructor <init>(Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;Landroid/widget/ListView;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment$3;->this$0:Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;

    iput-object p2, p0, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment$3;->val$calendarListView:Landroid/widget/ListView;

    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemLongClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)Z
    .locals 3
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
    .line 82
    .local p1, "arg0":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment$3;->val$calendarListView:Landroid/widget/ListView;

    invoke-virtual {v1, p3}, Landroid/widget/ListView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/model/object/crud/Match;

    .line 84
    .local v0, "match":Lcom/blank/bm15/model/object/crud/Match;
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Match;->getMatchday()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/16 v2, 0xe2

    if-gt v1, v2, :cond_0

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Match;->getMatchday()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iget-object v2, p0, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment$3;->this$0:Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;

    invoke-static {v2}, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;->access$4(Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;)Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-le v1, v2, :cond_0

    .line 85
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment$3;->this$0:Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;->access$0(Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;)Lcom/blank/bm15/activity/HomeActivity;

    move-result-object v1

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Match;->getMatchday()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/blank/bm15/activity/HomeActivity;->play(I)V

    .line 87
    :cond_0
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    return v1
.end method
