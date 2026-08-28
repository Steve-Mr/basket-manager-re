.class public Lcom/blank/bm15/activity/MainActivity;
.super Lcom/blank/bm15/activity/base/BaseActivity;
.source "MainActivity.java"


# instance fields
.field private editTextUrl:Landroid/widget/EditText;

.field private selectedFile:Ljava/io/File;

.field private strFileList:[Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 55
    invoke-direct {p0}, Lcom/blank/bm15/activity/base/BaseActivity;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/blank/bm15/activity/MainActivity;Ljava/lang/String;Ljava/io/InputStream;Ljava/net/URL;)V
    .locals 0

    .prologue
    .line 319
    invoke-direct {p0, p1, p2, p3}, Lcom/blank/bm15/activity/MainActivity;->createGameInThread(Ljava/lang/String;Ljava/io/InputStream;Ljava/net/URL;)V

    return-void
.end method

.method static synthetic access$1(Lcom/blank/bm15/activity/MainActivity;)Landroid/widget/EditText;
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lcom/blank/bm15/activity/MainActivity;->editTextUrl:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$2(Lcom/blank/bm15/activity/MainActivity;)Ljava/io/File;
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lcom/blank/bm15/activity/MainActivity;->selectedFile:Ljava/io/File;

    return-object v0
.end method

.method static synthetic access$3(Lcom/blank/bm15/activity/MainActivity;)[Ljava/lang/String;
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lcom/blank/bm15/activity/MainActivity;->strFileList:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$4(Lcom/blank/bm15/activity/MainActivity;Ljava/io/File;)V
    .locals 0

    .prologue
    .line 58
    iput-object p1, p0, Lcom/blank/bm15/activity/MainActivity;->selectedFile:Ljava/io/File;

    return-void
.end method

.method private createGameInThread(Ljava/lang/String;Ljava/io/InputStream;Ljava/net/URL;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "is"    # Ljava/io/InputStream;
    .param p3, "url"    # Ljava/net/URL;

    .prologue
    .line 320
    const v0, 0x7f050086

    invoke-direct {p0, v0}, Lcom/blank/bm15/activity/MainActivity;->showProcessBar(I)V

    .line 323
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/blank/bm15/activity/MainActivity$10;

    invoke-direct {v1, p0, p2, p3, p1}, Lcom/blank/bm15/activity/MainActivity$10;-><init>(Lcom/blank/bm15/activity/MainActivity;Ljava/io/InputStream;Ljava/net/URL;Ljava/lang/String;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 347
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 348
    return-void
.end method

.method private createPage()V
    .locals 5

    .prologue
    .line 273
    invoke-virtual {p0}, Lcom/blank/bm15/activity/MainActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    .line 274
    .local v0, "actionBar":Landroid/app/ActionBar;
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    invoke-virtual {v0, v3}, Landroid/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 276
    new-instance v3, Lcom/blank/bm15/model/object/crud/Game;

    invoke-direct {v3, p0}, Lcom/blank/bm15/model/object/crud/Game;-><init>(Landroid/content/Context;)V

    invoke-static {v3}, Lcom/blank/bm15/dao/BlankDao;->getAll(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v1

    .line 278
    .local v1, "gameList":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Game;>;"
    const v3, 0x7f0b001a

    invoke-virtual {p0, v3}, Lcom/blank/bm15/activity/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ListView;

    .line 279
    .local v2, "listView":Landroid/widget/ListView;
    new-instance v3, Lcom/blank/bm15/activity/adapter/AdapterGameList;

    const v4, 0x7f030019

    invoke-direct {v3, p0, v4, v1}, Lcom/blank/bm15/activity/adapter/AdapterGameList;-><init>(Landroid/content/Context;ILjava/util/List;)V

    invoke-virtual {v2, v3}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 280
    new-instance v3, Lcom/blank/bm15/activity/MainActivity$8;

    invoke-direct {v3, p0, v2}, Lcom/blank/bm15/activity/MainActivity$8;-><init>(Lcom/blank/bm15/activity/MainActivity;Landroid/widget/ListView;)V

    invoke-virtual {v2, v3}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 294
    new-instance v3, Lcom/blank/bm15/activity/MainActivity$9;

    invoke-direct {v3, p0, v2}, Lcom/blank/bm15/activity/MainActivity$9;-><init>(Lcom/blank/bm15/activity/MainActivity;Landroid/widget/ListView;)V

    invoke-virtual {v2, v3}, Landroid/widget/ListView;->setOnItemLongClickListener(Landroid/widget/AdapterView$OnItemLongClickListener;)V

    .line 317
    return-void
.end method

.method private hideProcessBar()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 380
    const v5, 0x7f0b0017

    invoke-virtual {p0, v5}, Lcom/blank/bm15/activity/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 381
    .local v0, "button":Landroid/widget/Button;
    invoke-virtual {v0, v6}, Landroid/widget/Button;->setVisibility(I)V

    .line 382
    const v5, 0x7f0b0018

    invoke-virtual {p0, v5}, Lcom/blank/bm15/activity/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 383
    .local v1, "buttonOnline":Landroid/widget/Button;
    invoke-virtual {v1, v6}, Landroid/widget/Button;->setVisibility(I)V

    .line 385
    const v5, 0x7f0b0019

    invoke-virtual {p0, v5}, Lcom/blank/bm15/activity/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 386
    .local v4, "textViewInfo":Landroid/widget/TextView;
    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 387
    const v5, 0x7f0b001a

    invoke-virtual {p0, v5}, Lcom/blank/bm15/activity/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ListView;

    .line 388
    .local v3, "listView":Landroid/widget/ListView;
    invoke-virtual {v3, v6}, Landroid/widget/ListView;->setVisibility(I)V

    .line 390
    const v5, 0x7f0b001c

    invoke-virtual {p0, v5}, Lcom/blank/bm15/activity/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/RelativeLayout;

    .line 391
    .local v2, "layout":Landroid/widget/RelativeLayout;
    const/16 v5, 0x8

    invoke-virtual {v2, v5}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 392
    return-void
.end method

.method private showProcessBar(I)V
    .locals 8
    .param p1, "title"    # I

    .prologue
    const/4 v7, 0x4

    .line 363
    const v6, 0x7f0b0017

    invoke-virtual {p0, v6}, Lcom/blank/bm15/activity/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 364
    .local v0, "button":Landroid/widget/Button;
    invoke-virtual {v0, v7}, Landroid/widget/Button;->setVisibility(I)V

    .line 365
    const v6, 0x7f0b0018

    invoke-virtual {p0, v6}, Lcom/blank/bm15/activity/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 366
    .local v1, "buttonOnline":Landroid/widget/Button;
    invoke-virtual {v1, v7}, Landroid/widget/Button;->setVisibility(I)V

    .line 368
    const v6, 0x7f0b0019

    invoke-virtual {p0, v6}, Lcom/blank/bm15/activity/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 369
    .local v4, "textViewInfo":Landroid/widget/TextView;
    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 370
    const v6, 0x7f0b001a

    invoke-virtual {p0, v6}, Lcom/blank/bm15/activity/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ListView;

    .line 371
    .local v3, "listView":Landroid/widget/ListView;
    invoke-virtual {v3, v7}, Landroid/widget/ListView;->setVisibility(I)V

    .line 373
    const v6, 0x7f0b001c

    invoke-virtual {p0, v6}, Lcom/blank/bm15/activity/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/RelativeLayout;

    .line 374
    .local v2, "layout":Landroid/widget/RelativeLayout;
    const/4 v6, 0x0

    invoke-virtual {v2, v6}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 375
    const v6, 0x7f0b001e

    invoke-virtual {p0, v6}, Lcom/blank/bm15/activity/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 376
    .local v5, "textViewTitle":Landroid/widget/TextView;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 377
    return-void
.end method


# virtual methods
.method public deleteGameInThread(Lcom/blank/bm15/model/object/crud/Game;)V
    .locals 2
    .param p1, "game"    # Lcom/blank/bm15/model/object/crud/Game;

    .prologue
    .line 351
    const v0, 0x7f050087

    invoke-direct {p0, v0}, Lcom/blank/bm15/activity/MainActivity;->showProcessBar(I)V

    .line 354
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/blank/bm15/activity/MainActivity$11;

    invoke-direct {v1, p0, p1}, Lcom/blank/bm15/activity/MainActivity$11;-><init>(Lcom/blank/bm15/activity/MainActivity;Lcom/blank/bm15/model/object/crud/Game;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 359
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 360
    return-void
.end method

.method public onBackPressed()V
    .locals 0

    .prologue
    .line 76
    invoke-virtual {p0}, Lcom/blank/bm15/activity/MainActivity;->finishAffinity()V

    .line 77
    return-void
.end method

.method protected onChoseFileCreateDialog()V
    .locals 8

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 232
    invoke-virtual {p0}, Lcom/blank/bm15/activity/MainActivity;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v4

    iget v4, v4, Landroid/content/pm/ApplicationInfo;->labelRes:I

    invoke-virtual {p0, v4}, Lcom/blank/bm15/activity/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 233
    .local v3, "subfolder":Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 234
    .local v2, "sdCardDir":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_0

    .line 235
    invoke-virtual {v2}, Ljava/io/File;->mkdir()Z

    .line 238
    :cond_0
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 239
    new-instance v1, Lcom/blank/bm15/activity/MainActivity$6;

    invoke-direct {v1, p0}, Lcom/blank/bm15/activity/MainActivity$6;-><init>(Lcom/blank/bm15/activity/MainActivity;)V

    .line 248
    .local v1, "filter":Ljava/io/FilenameFilter;
    invoke-virtual {v2, v1}, Ljava/io/File;->list(Ljava/io/FilenameFilter;)[Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/blank/bm15/activity/MainActivity;->strFileList:[Ljava/lang/String;

    .line 254
    .end local v1    # "filter":Ljava/io/FilenameFilter;
    :goto_0
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 256
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    const v4, 0x7f05005f

    invoke-virtual {p0, v4}, Lcom/blank/bm15/activity/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    new-array v5, v7, [Ljava/lang/Object;

    aput-object v3, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 257
    iget-object v4, p0, Lcom/blank/bm15/activity/MainActivity;->strFileList:[Ljava/lang/String;

    if-eqz v4, :cond_1

    iget-object v4, p0, Lcom/blank/bm15/activity/MainActivity;->strFileList:[Ljava/lang/String;

    array-length v4, v4

    if-nez v4, :cond_3

    .line 258
    :cond_1
    const v4, 0x7f05007c

    invoke-virtual {p0, v4}, Lcom/blank/bm15/activity/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    new-array v5, v7, [Ljava/lang/Object;

    aput-object v3, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {p0, v4}, Lcom/blank/bm15/model/util/Alert;->showErrorDialog(Landroid/app/Activity;Ljava/lang/String;)V

    .line 269
    :goto_1
    return-void

    .line 250
    .end local v0    # "builder":Landroid/app/AlertDialog$Builder;
    :cond_2
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/blank/bm15/activity/MainActivity;->strFileList:[Ljava/lang/String;

    goto :goto_0

    .line 261
    .restart local v0    # "builder":Landroid/app/AlertDialog$Builder;
    :cond_3
    iget-object v4, p0, Lcom/blank/bm15/activity/MainActivity;->strFileList:[Ljava/lang/String;

    new-instance v5, Lcom/blank/bm15/activity/MainActivity$7;

    invoke-direct {v5, p0, v2}, Lcom/blank/bm15/activity/MainActivity$7;-><init>(Lcom/blank/bm15/activity/MainActivity;Ljava/io/File;)V

    invoke-virtual {v0, v4, v5}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 268
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_1
.end method

.method public onClickBM15PRO(Landroid/view/View;)V
    .locals 5
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 113
    const-string v1, "com.blank.bm16pro"

    .line 115
    .local v1, "appPackageName":Ljava/lang/String;
    :try_start_0
    new-instance v2, Landroid/content/Intent;

    const-string v3, "android.intent.action.VIEW"

    const-string v4, "market://details?id=com.blank.bm16pro"

    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {p0, v2}, Lcom/blank/bm15/activity/MainActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 119
    :goto_0
    return-void

    .line 116
    :catch_0
    move-exception v0

    .line 117
    .local v0, "anfe":Landroid/content/ActivityNotFoundException;
    new-instance v2, Landroid/content/Intent;

    const-string v3, "android.intent.action.VIEW"

    const-string v4, "http://play.google.com/store/apps/details?id=com.blank.bm16pro"

    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {p0, v2}, Lcom/blank/bm15/activity/MainActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method public onClickGameNewCustom(Landroid/view/View;)V
    .locals 10
    .param p1, "view"    # Landroid/view/View;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InflateParams"
        }
    .end annotation

    .prologue
    .line 172
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 173
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/MainActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v4

    .line 175
    .local v4, "inflater":Landroid/view/LayoutInflater;
    new-instance v6, Ljava/text/SimpleDateFormat;

    const-string v7, "dd/MM/yyyy HH:mm"

    invoke-direct {v6, v7}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 176
    .local v6, "sdf":Ljava/text/SimpleDateFormat;
    new-instance v7, Ljava/util/Date;

    invoke-direct {v7}, Ljava/util/Date;-><init>()V

    invoke-virtual {v6, v7}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    .line 178
    .local v1, "currentDate":Ljava/lang/String;
    const v7, 0x7f030003

    const/4 v8, 0x0

    invoke-virtual {v4, v7, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 179
    .local v2, "dialogView":Landroid/view/View;
    const v7, 0x7f0b0022

    invoke-virtual {v2, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    .line 180
    .local v3, "editText":Landroid/widget/EditText;
    invoke-virtual {v3, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 181
    const v7, 0x7f0b0026

    invoke-virtual {v2, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/EditText;

    iput-object v7, p0, Lcom/blank/bm15/activity/MainActivity;->editTextUrl:Landroid/widget/EditText;

    .line 182
    const v7, 0x7f0b0023

    invoke-virtual {v2, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/RadioGroup;

    .line 183
    .local v5, "radioGroup":Landroid/widget/RadioGroup;
    new-instance v7, Lcom/blank/bm15/activity/MainActivity$3;

    invoke-direct {v7, p0}, Lcom/blank/bm15/activity/MainActivity$3;-><init>(Lcom/blank/bm15/activity/MainActivity;)V

    invoke-virtual {v5, v7}, Landroid/widget/RadioGroup;->setOnCheckedChangeListener(Landroid/widget/RadioGroup$OnCheckedChangeListener;)V

    .line 196
    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    .line 197
    const v8, 0x7f050046

    invoke-virtual {p0, v8}, Lcom/blank/bm15/activity/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object v8

    new-instance v9, Lcom/blank/bm15/activity/MainActivity$4;

    invoke-direct {v9, p0, v3, v5}, Lcom/blank/bm15/activity/MainActivity$4;-><init>(Lcom/blank/bm15/activity/MainActivity;Landroid/widget/EditText;Landroid/widget/RadioGroup;)V

    invoke-virtual {v7, v8, v9}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    .line 221
    const v8, 0x7f050048

    invoke-virtual {p0, v8}, Lcom/blank/bm15/activity/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object v8

    new-instance v9, Lcom/blank/bm15/activity/MainActivity$5;

    invoke-direct {v9, p0}, Lcom/blank/bm15/activity/MainActivity$5;-><init>(Lcom/blank/bm15/activity/MainActivity;)V

    invoke-virtual {v7, v8, v9}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 227
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v7

    iput-object v7, p0, Lcom/blank/bm15/activity/MainActivity;->alertDialog:Landroid/app/AlertDialog;

    .line 228
    iget-object v7, p0, Lcom/blank/bm15/activity/MainActivity;->alertDialog:Landroid/app/AlertDialog;

    invoke-virtual {v7}, Landroid/app/AlertDialog;->show()V

    .line 229
    return-void
.end method

.method public onClickGameNewDefault(Landroid/view/View;)V
    .locals 10
    .param p1, "view"    # Landroid/view/View;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InflateParams"
        }
    .end annotation

    .prologue
    .line 123
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 124
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    invoke-virtual {p0}, Lcom/blank/bm15/activity/MainActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v4

    .line 126
    .local v4, "inflater":Landroid/view/LayoutInflater;
    new-instance v6, Ljava/text/SimpleDateFormat;

    const-string v7, "dd/MM/yyyy HH:mm"

    invoke-direct {v6, v7}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 127
    .local v6, "sdf":Ljava/text/SimpleDateFormat;
    new-instance v7, Ljava/util/Date;

    invoke-direct {v7}, Ljava/util/Date;-><init>()V

    invoke-virtual {v6, v7}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    .line 129
    .local v1, "currentDate":Ljava/lang/String;
    const v7, 0x7f030004

    const/4 v8, 0x0

    invoke-virtual {v4, v7, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 130
    .local v2, "dialogView":Landroid/view/View;
    const v7, 0x7f0b0028

    invoke-virtual {v2, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    .line 131
    .local v3, "editText":Landroid/widget/EditText;
    invoke-virtual {v3, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 132
    const v7, 0x7f0b0029

    invoke-virtual {v2, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/RadioGroup;

    .line 134
    .local v5, "radioGroup":Landroid/widget/RadioGroup;
    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    .line 135
    const v8, 0x7f050046

    invoke-virtual {p0, v8}, Lcom/blank/bm15/activity/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object v8

    new-instance v9, Lcom/blank/bm15/activity/MainActivity$1;

    invoke-direct {v9, p0, v3, v5}, Lcom/blank/bm15/activity/MainActivity$1;-><init>(Lcom/blank/bm15/activity/MainActivity;Landroid/widget/EditText;Landroid/widget/RadioGroup;)V

    invoke-virtual {v7, v8, v9}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    .line 160
    const v8, 0x7f050048

    invoke-virtual {p0, v8}, Lcom/blank/bm15/activity/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object v8

    new-instance v9, Lcom/blank/bm15/activity/MainActivity$2;

    invoke-direct {v9, p0}, Lcom/blank/bm15/activity/MainActivity$2;-><init>(Lcom/blank/bm15/activity/MainActivity;)V

    invoke-virtual {v7, v8, v9}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 166
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v7

    iput-object v7, p0, Lcom/blank/bm15/activity/MainActivity;->alertDialog:Landroid/app/AlertDialog;

    .line 167
    iget-object v7, p0, Lcom/blank/bm15/activity/MainActivity;->alertDialog:Landroid/app/AlertDialog;

    invoke-virtual {v7}, Landroid/app/AlertDialog;->show()V

    .line 168
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 63
    invoke-super {p0, p1}, Lcom/blank/bm15/activity/base/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 64
    const v0, 0x7f030001

    invoke-virtual {p0, v0}, Lcom/blank/bm15/activity/MainActivity;->setContentView(I)V

    .line 65
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 70
    invoke-virtual {p0}, Lcom/blank/bm15/activity/MainActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const/high16 v1, 0x7f0a0000

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 71
    const/4 v0, 0x1

    return v0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 3
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 81
    if-eqz p1, :cond_0

    .line 82
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    const v2, 0x7f0b0146

    if-ne v1, v2, :cond_1

    .line 83
    invoke-static {p0}, Lcom/blank/bm15/model/core/Create;->createRosterFile(Landroid/content/Context;)V

    .line 102
    :cond_0
    :goto_0
    invoke-super {p0, p1}, Lcom/blank/bm15/activity/base/BaseActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    return v1

    .line 84
    :cond_1
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    const v2, 0x7f0b0147

    if-ne v1, v2, :cond_2

    .line 85
    new-instance v0, Lcom/blank/bm15/model/object/crud/Team;

    invoke-direct {v0, p0}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    .line 86
    .local v0, "export":Lcom/blank/bm15/model/object/crud/Team;
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->getAll(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v1

    invoke-static {v1}, Lcom/blank/bm15/dao/BlankDao;->exportToCSV(Ljava/util/List;)V

    goto :goto_0

    .line 87
    .end local v0    # "export":Lcom/blank/bm15/model/object/crud/Team;
    :cond_2
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    const v2, 0x7f0b0148

    if-ne v1, v2, :cond_3

    .line 88
    new-instance v0, Lcom/blank/bm15/model/object/crud/Match;

    invoke-direct {v0, p0}, Lcom/blank/bm15/model/object/crud/Match;-><init>(Landroid/content/Context;)V

    .line 89
    .local v0, "export":Lcom/blank/bm15/model/object/crud/Match;
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->getAll(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v1

    invoke-static {v1}, Lcom/blank/bm15/dao/BlankDao;->exportToCSV(Ljava/util/List;)V

    goto :goto_0

    .line 90
    .end local v0    # "export":Lcom/blank/bm15/model/object/crud/Match;
    :cond_3
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    const v2, 0x7f0b0149

    if-ne v1, v2, :cond_4

    .line 91
    new-instance v0, Lcom/blank/bm15/model/object/crud/MatchResult;

    invoke-direct {v0, p0}, Lcom/blank/bm15/model/object/crud/MatchResult;-><init>(Landroid/content/Context;)V

    .line 92
    .local v0, "export":Lcom/blank/bm15/model/object/crud/MatchResult;
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->getAll(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v1

    invoke-static {v1}, Lcom/blank/bm15/dao/BlankDao;->exportToCSV(Ljava/util/List;)V

    goto :goto_0

    .line 93
    .end local v0    # "export":Lcom/blank/bm15/model/object/crud/MatchResult;
    :cond_4
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    const v2, 0x7f0b014a

    if-ne v1, v2, :cond_5

    .line 94
    new-instance v0, Lcom/blank/bm15/model/object/crud/Player;

    invoke-direct {v0, p0}, Lcom/blank/bm15/model/object/crud/Player;-><init>(Landroid/content/Context;)V

    .line 95
    .local v0, "export":Lcom/blank/bm15/model/object/crud/Player;
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->getAll(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v1

    invoke-static {v1}, Lcom/blank/bm15/dao/BlankDao;->exportToCSV(Ljava/util/List;)V

    goto :goto_0

    .line 96
    .end local v0    # "export":Lcom/blank/bm15/model/object/crud/Player;
    :cond_5
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    const v2, 0x7f0b014b

    if-ne v1, v2, :cond_0

    .line 97
    new-instance v0, Lcom/blank/bm15/model/object/crud/Playoffs;

    invoke-direct {v0, p0}, Lcom/blank/bm15/model/object/crud/Playoffs;-><init>(Landroid/content/Context;)V

    .line 98
    .local v0, "export":Lcom/blank/bm15/model/object/crud/Playoffs;
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->getAll(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v1

    invoke-static {v1}, Lcom/blank/bm15/dao/BlankDao;->exportToCSV(Ljava/util/List;)V

    goto :goto_0
.end method

.method protected onResume()V
    .locals 0

    .prologue
    .line 107
    invoke-super {p0}, Lcom/blank/bm15/activity/base/BaseActivity;->onResume()V

    .line 108
    invoke-direct {p0}, Lcom/blank/bm15/activity/MainActivity;->hideProcessBar()V

    .line 109
    invoke-direct {p0}, Lcom/blank/bm15/activity/MainActivity;->createPage()V

    .line 110
    return-void
.end method

.method public showToastError()V
    .locals 1

    .prologue
    .line 395
    new-instance v0, Lcom/blank/bm15/activity/MainActivity$12;

    invoke-direct {v0, p0}, Lcom/blank/bm15/activity/MainActivity$12;-><init>(Lcom/blank/bm15/activity/MainActivity;)V

    invoke-virtual {p0, v0}, Lcom/blank/bm15/activity/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 403
    return-void
.end method
