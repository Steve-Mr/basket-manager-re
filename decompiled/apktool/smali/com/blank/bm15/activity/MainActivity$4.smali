.class Lcom/blank/bm15/activity/MainActivity$4;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


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

.field private final synthetic val$editText:Landroid/widget/EditText;

.field private final synthetic val$radioGroup:Landroid/widget/RadioGroup;


# direct methods
.method constructor <init>(Lcom/blank/bm15/activity/MainActivity;Landroid/widget/EditText;Landroid/widget/RadioGroup;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/blank/bm15/activity/MainActivity$4;->this$0:Lcom/blank/bm15/activity/MainActivity;

    iput-object p2, p0, Lcom/blank/bm15/activity/MainActivity$4;->val$editText:Landroid/widget/EditText;

    iput-object p3, p0, Lcom/blank/bm15/activity/MainActivity$4;->val$radioGroup:Landroid/widget/RadioGroup;

    .line 197
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 10
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "id"    # I

    .prologue
    .line 199
    iget-object v7, p0, Lcom/blank/bm15/activity/MainActivity$4;->val$editText:Landroid/widget/EditText;

    invoke-virtual {v7}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v7

    invoke-static {v7}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 200
    .local v3, "name":Ljava/lang/String;
    iget-object v7, p0, Lcom/blank/bm15/activity/MainActivity$4;->this$0:Lcom/blank/bm15/activity/MainActivity;

    invoke-static {v7}, Lcom/blank/bm15/activity/MainActivity;->access$1(Lcom/blank/bm15/activity/MainActivity;)Landroid/widget/EditText;

    move-result-object v7

    invoke-virtual {v7}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v7

    invoke-static {v7}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 202
    .local v4, "strUrl":Ljava/lang/String;
    const-string v7, ""

    invoke-virtual {v7, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 203
    iget-object v7, p0, Lcom/blank/bm15/activity/MainActivity$4;->this$0:Lcom/blank/bm15/activity/MainActivity;

    iget-object v8, p0, Lcom/blank/bm15/activity/MainActivity$4;->this$0:Lcom/blank/bm15/activity/MainActivity;

    invoke-virtual {v8}, Lcom/blank/bm15/activity/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f050078

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/blank/bm15/model/util/Alert;->showErrorDialog(Landroid/app/Activity;Ljava/lang/String;)V

    .line 220
    :goto_0
    return-void

    .line 205
    :cond_0
    invoke-interface {p1}, Landroid/content/DialogInterface;->cancel()V

    .line 207
    const/4 v1, 0x0

    .line 208
    .local v1, "is":Ljava/io/InputStream;
    const/4 v5, 0x0

    .line 210
    .local v5, "url":Ljava/net/URL;
    :try_start_0
    iget-object v7, p0, Lcom/blank/bm15/activity/MainActivity$4;->val$radioGroup:Landroid/widget/RadioGroup;

    invoke-virtual {v7}, Landroid/widget/RadioGroup;->getCheckedRadioButtonId()I

    move-result v7

    const v8, 0x7f0b0025

    if-ne v7, v8, :cond_1

    .line 211
    new-instance v6, Ljava/net/URL;

    invoke-direct {v6, v4}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .end local v5    # "url":Ljava/net/URL;
    .local v6, "url":Ljava/net/URL;
    move-object v5, v6

    .line 218
    .end local v6    # "url":Ljava/net/URL;
    .restart local v5    # "url":Ljava/net/URL;
    :goto_1
    iget-object v7, p0, Lcom/blank/bm15/activity/MainActivity$4;->this$0:Lcom/blank/bm15/activity/MainActivity;

    invoke-static {v7, v3, v1, v5}, Lcom/blank/bm15/activity/MainActivity;->access$0(Lcom/blank/bm15/activity/MainActivity;Ljava/lang/String;Ljava/io/InputStream;Ljava/net/URL;)V

    goto :goto_0

    .line 213
    :cond_1
    :try_start_1
    new-instance v2, Ljava/io/FileInputStream;

    iget-object v7, p0, Lcom/blank/bm15/activity/MainActivity$4;->this$0:Lcom/blank/bm15/activity/MainActivity;

    invoke-static {v7}, Lcom/blank/bm15/activity/MainActivity;->access$2(Lcom/blank/bm15/activity/MainActivity;)Ljava/io/File;

    move-result-object v7

    invoke-direct {v2, v7}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .end local v1    # "is":Ljava/io/InputStream;
    .local v2, "is":Ljava/io/InputStream;
    move-object v1, v2

    .line 215
    .end local v2    # "is":Ljava/io/InputStream;
    .restart local v1    # "is":Ljava/io/InputStream;
    goto :goto_1

    :catch_0
    move-exception v0

    .line 216
    .local v0, "e":Ljava/lang/Exception;
    const-string v7, "MainActivity"

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method
