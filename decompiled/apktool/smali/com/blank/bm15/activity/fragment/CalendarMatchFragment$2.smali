.class Lcom/blank/bm15/activity/fragment/CalendarMatchFragment$2;
.super Ljava/lang/Object;
.source "CalendarMatchFragment.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


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
        "Landroid/widget/AdapterView$OnItemClickListener;"
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
    iput-object p1, p0, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment$2;->this$0:Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;

    iput-object p2, p0, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment$2;->val$calendarListView:Landroid/widget/ListView;

    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
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
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 74
    .local p1, "arg0":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment$2;->val$calendarListView:Landroid/widget/ListView;

    invoke-virtual {v1, p3}, Landroid/widget/ListView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/model/object/crud/Match;

    .line 75
    .local v0, "match":Lcom/blank/bm15/model/object/crud/Match;
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment$2;->this$0:Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;

    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/Match;->getMatchday()Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;->access$2(Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;Ljava/lang/Integer;)V

    .line 76
    iget-object v1, p0, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment$2;->this$0:Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;

    invoke-static {v1}, Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;->access$3(Lcom/blank/bm15/activity/fragment/CalendarMatchFragment;)V

    .line 77
    return-void
.end method
