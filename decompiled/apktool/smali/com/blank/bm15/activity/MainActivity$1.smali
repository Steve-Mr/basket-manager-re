.class Lcom/blank/bm15/activity/MainActivity$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blank/bm15/activity/MainActivity;->onClickGameNewDefault(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/blank/bm15/activity/MainActivity;

.field private final synthetic val$editText:Landroid/widget/EditText;

.field private final synthetic val$radioGroup:Landroid/widget/RadioGroup;


# direct methods
.method constructor <init>(Lcom/blank/bm15/activity/MainActivity;Landroid/widget/EditText;Landroid/widget/RadioGroup;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/blank/bm15/activity/MainActivity$1;->this$0:Lcom/blank/bm15/activity/MainActivity;

    iput-object p2, p0, Lcom/blank/bm15/activity/MainActivity$1;->val$editText:Landroid/widget/EditText;

    iput-object p3, p0, Lcom/blank/bm15/activity/MainActivity$1;->val$radioGroup:Landroid/widget/RadioGroup;

    .line 135
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 9
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "id"    # I

    .prologue
    .line 137
    iget-object v6, p0, Lcom/blank/bm15/activity/MainActivity$1;->val$editText:Landroid/widget/EditText;

    invoke-virtual {v6}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v6

    invoke-static {v6}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 139
    .local v2, "name":Ljava/lang/String;
    const-string v6, ""

    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 140
    iget-object v6, p0, Lcom/blank/bm15/activity/MainActivity$1;->this$0:Lcom/blank/bm15/activity/MainActivity;

    iget-object v7, p0, Lcom/blank/bm15/activity/MainActivity$1;->this$0:Lcom/blank/bm15/activity/MainActivity;

    invoke-virtual {v7}, Lcom/blank/bm15/activity/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f050078

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/blank/bm15/model/util/Alert;->showErrorDialog(Landroid/app/Activity;Ljava/lang/String;)V

    .line 159
    :goto_0
    return-void

    .line 142
    :cond_0
    invoke-interface {p1}, Landroid/content/DialogInterface;->cancel()V

    .line 144
    const/4 v1, 0x0

    .line 145
    .local v1, "is":Ljava/io/InputStream;
    const/4 v4, 0x0

    .line 146
    .local v4, "url":Ljava/net/URL;
    iget-object v6, p0, Lcom/blank/bm15/activity/MainActivity$1;->val$radioGroup:Landroid/widget/RadioGroup;

    invoke-virtual {v6}, Landroid/widget/RadioGroup;->getCheckedRadioButtonId()I

    move-result v6

    const v7, 0x7f0b002b

    if-ne v6, v7, :cond_1

    .line 148
    :try_start_0
    iget-object v6, p0, Lcom/blank/bm15/activity/MainActivity$1;->this$0:Lcom/blank/bm15/activity/MainActivity;

    const v7, 0x7f050092

    invoke-virtual {v6, v7}, Lcom/blank/bm15/activity/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 149
    .local v3, "strUrl":Ljava/lang/String;
    new-instance v5, Ljava/net/URL;

    invoke-direct {v5, v3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .end local v4    # "url":Ljava/net/URL;
    .local v5, "url":Ljava/net/URL;
    move-object v4, v5

    .line 157
    .end local v3    # "strUrl":Ljava/lang/String;
    .end local v5    # "url":Ljava/net/URL;
    .restart local v4    # "url":Ljava/net/URL;
    :goto_1
    iget-object v6, p0, Lcom/blank/bm15/activity/MainActivity$1;->this$0:Lcom/blank/bm15/activity/MainActivity;

    invoke-static {v6, v2, v1, v4}, Lcom/blank/bm15/activity/MainActivity;->access$0(Lcom/blank/bm15/activity/MainActivity;Ljava/lang/String;Ljava/io/InputStream;Ljava/net/URL;)V

    goto :goto_0

    .line 150
    :catch_0
    move-exception v0

    .line 151
    .local v0, "e":Ljava/lang/Exception;
    const-string v6, "MainActivity"

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 154
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_1
    iget-object v6, p0, Lcom/blank/bm15/activity/MainActivity$1;->this$0:Lcom/blank/bm15/activity/MainActivity;

    invoke-virtual {v6}, Lcom/blank/bm15/activity/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const/high16 v7, 0x7f040000

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v1

    goto :goto_1
.end method
