.class Lcom/blank/bm15/activity/MainActivity$3;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/widget/RadioGroup$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blank/bm15/activity/MainActivity;->onClickGameNewCustom(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/blank/bm15/activity/MainActivity;


# direct methods
.method constructor <init>(Lcom/blank/bm15/activity/MainActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/blank/bm15/activity/MainActivity$3;->this$0:Lcom/blank/bm15/activity/MainActivity;

    .line 183
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/RadioGroup;I)V
    .locals 2
    .param p1, "group"    # Landroid/widget/RadioGroup;
    .param p2, "checkedId"    # I

    .prologue
    .line 185
    iget-object v0, p0, Lcom/blank/bm15/activity/MainActivity$3;->this$0:Lcom/blank/bm15/activity/MainActivity;

    invoke-static {v0}, Lcom/blank/bm15/activity/MainActivity;->access$1(Lcom/blank/bm15/activity/MainActivity;)Landroid/widget/EditText;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 186
    const v0, 0x7f0b0025

    if-ne p2, v0, :cond_0

    .line 187
    iget-object v0, p0, Lcom/blank/bm15/activity/MainActivity$3;->this$0:Lcom/blank/bm15/activity/MainActivity;

    invoke-static {v0}, Lcom/blank/bm15/activity/MainActivity;->access$1(Lcom/blank/bm15/activity/MainActivity;)Landroid/widget/EditText;

    move-result-object v0

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setEnabled(Z)V

    .line 193
    :goto_0
    return-void

    .line 189
    :cond_0
    iget-object v0, p0, Lcom/blank/bm15/activity/MainActivity$3;->this$0:Lcom/blank/bm15/activity/MainActivity;

    invoke-static {v0}, Lcom/blank/bm15/activity/MainActivity;->access$1(Lcom/blank/bm15/activity/MainActivity;)Landroid/widget/EditText;

    move-result-object v0

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setEnabled(Z)V

    .line 191
    iget-object v0, p0, Lcom/blank/bm15/activity/MainActivity$3;->this$0:Lcom/blank/bm15/activity/MainActivity;

    invoke-virtual {v0}, Lcom/blank/bm15/activity/MainActivity;->onChoseFileCreateDialog()V

    goto :goto_0
.end method
