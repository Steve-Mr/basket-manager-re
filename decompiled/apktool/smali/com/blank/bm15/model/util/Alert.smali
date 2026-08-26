.class public Lcom/blank/bm15/model/util/Alert;
.super Ljava/lang/Object;
.source "Alert.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getBuilder(Landroid/app/Activity;)Landroid/app/AlertDialog$Builder;
    .locals 2
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    .line 18
    new-instance v0, Landroid/app/AlertDialog$Builder;

    const/4 v1, 0x3

    invoke-direct {v0, p0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;I)V

    return-object v0
.end method

.method private static showAlertDialog(Landroid/app/Activity;IILjava/lang/String;)V
    .locals 1
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "icon"    # I
    .param p2, "title"    # I
    .param p3, "message"    # Ljava/lang/String;

    .prologue
    .line 101
    invoke-virtual {p0, p2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, p1, v0, p3}, Lcom/blank/bm15/model/util/Alert;->showAlertDialog(Landroid/app/Activity;ILjava/lang/String;Ljava/lang/String;)V

    .line 102
    return-void
.end method

.method private static showAlertDialog(Landroid/app/Activity;ILjava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "icon"    # I
    .param p2, "title"    # Ljava/lang/String;
    .param p3, "message"    # Ljava/lang/String;

    .prologue
    .line 112
    invoke-static {p0}, Lcom/blank/bm15/model/util/Alert;->getBuilder(Landroid/app/Activity;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 113
    .local v1, "builder":Landroid/app/AlertDialog$Builder;
    invoke-virtual {v1, p2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 114
    invoke-virtual {v2, p3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 115
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 116
    invoke-virtual {v2, p1}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 117
    const v3, 0x7f050047

    invoke-virtual {p0, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Lcom/blank/bm15/model/util/Alert$1;

    invoke-direct {v4}, Lcom/blank/bm15/model/util/Alert$1;-><init>()V

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 122
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 123
    .local v0, "alert":Landroid/app/AlertDialog;
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 124
    return-void
.end method

.method public static showErrorDialog(Landroid/app/Activity;Ljava/lang/Integer;)V
    .locals 1
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "message"    # Ljava/lang/Integer;

    .prologue
    .line 81
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/blank/bm15/model/util/Alert;->showErrorDialog(Landroid/app/Activity;Ljava/lang/String;)V

    .line 82
    return-void
.end method

.method public static showErrorDialog(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 2
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 90
    const v0, 0x7f02002e

    const v1, 0x7f050077

    invoke-static {p0, v0, v1, p1}, Lcom/blank/bm15/model/util/Alert;->showAlertDialog(Landroid/app/Activity;IILjava/lang/String;)V

    .line 91
    return-void
.end method

.method public static showInfoDialog(Landroid/app/Activity;Ljava/lang/Integer;)V
    .locals 1
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "message"    # Ljava/lang/Integer;

    .prologue
    .line 27
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/blank/bm15/model/util/Alert;->showInfoDialog(Landroid/app/Activity;Ljava/lang/String;)V

    .line 28
    return-void
.end method

.method public static showInfoDialog(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 2
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 36
    const v0, 0x7f02002f

    const v1, 0x7f050055

    invoke-static {p0, v0, v1, p1}, Lcom/blank/bm15/model/util/Alert;->showAlertDialog(Landroid/app/Activity;IILjava/lang/String;)V

    .line 37
    return-void
.end method

.method public static showNoticeDialog(Landroid/app/Activity;Ljava/lang/Integer;)V
    .locals 1
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "message"    # Ljava/lang/Integer;

    .prologue
    .line 45
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/blank/bm15/model/util/Alert;->showNoticeDialog(Landroid/app/Activity;Ljava/lang/String;)V

    .line 46
    return-void
.end method

.method public static showNoticeDialog(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 2
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 54
    const v0, 0x7f020031

    const v1, 0x7f050060

    invoke-static {p0, v0, v1, p1}, Lcom/blank/bm15/model/util/Alert;->showAlertDialog(Landroid/app/Activity;IILjava/lang/String;)V

    .line 55
    return-void
.end method

.method public static showWarningDialog(Landroid/app/Activity;Ljava/lang/Integer;)V
    .locals 1
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "message"    # Ljava/lang/Integer;

    .prologue
    .line 63
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/blank/bm15/model/util/Alert;->showWarningDialog(Landroid/app/Activity;Ljava/lang/String;)V

    .line 64
    return-void
.end method

.method public static showWarningDialog(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 2
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 72
    const v0, 0x7f020036

    const v1, 0x7f05006a

    invoke-static {p0, v0, v1, p1}, Lcom/blank/bm15/model/util/Alert;->showAlertDialog(Landroid/app/Activity;IILjava/lang/String;)V

    .line 73
    return-void
.end method
