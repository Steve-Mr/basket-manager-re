.class Lcom/blank/bm15/activity/fragment/DraftFragment$4;
.super Ljava/lang/Object;
.source "DraftFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blank/bm15/activity/fragment/DraftFragment;->createSelectPlayerAlert(Landroid/view/View;Lcom/blank/bm15/model/object/crud/Player;ILcom/blank/bm15/model/object/crud/DraftRound;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/blank/bm15/activity/fragment/DraftFragment;


# direct methods
.method constructor <init>(Lcom/blank/bm15/activity/fragment/DraftFragment;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/blank/bm15/activity/fragment/DraftFragment$4;->this$0:Lcom/blank/bm15/activity/fragment/DraftFragment;

    .line 108
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "id"    # I

    .prologue
    .line 110
    invoke-interface {p1}, Landroid/content/DialogInterface;->cancel()V

    .line 111
    return-void
.end method
