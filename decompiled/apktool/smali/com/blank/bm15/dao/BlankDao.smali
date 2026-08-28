.class public Lcom/blank/bm15/dao/BlankDao;
.super Ljava/lang/Object;
.source "BlankDao.java"


# static fields
.field public static final ID:Ljava/lang/String; = "id"

.field private static final TEMP:Ljava/lang/String; = "temp"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method protected static closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V
    .locals 0
    .param p0, "blankDatabaseManagement"    # Lcom/blank/bm15/dao/BlankDatabaseManagement;

    .prologue
    .line 626
    if-eqz p0, :cond_0

    .line 627
    invoke-virtual {p0}, Lcom/blank/bm15/dao/BlankDatabaseManagement;->close()V

    .line 629
    :cond_0
    return-void
.end method

.method protected static createNewInstance(Lcom/blank/bm15/dao/utils/BlankBase;)Lcom/blank/bm15/dao/utils/BlankBase;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/blank/bm15/dao/utils/BlankBase;",
            ">(TT;)TT;"
        }
    .end annotation

    .prologue
    .line 592
    .local p0, "obj":Lcom/blank/bm15/dao/utils/BlankBase;, "TT;"
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Landroid/content/Context;

    aput-object v6, v4, v5

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    .line 594
    .local v1, "con":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<+Lcom/blank/bm15/dao/utils/BlankBase;>;"
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {p0}, Lcom/blank/bm15/dao/utils/BlankBase;->getContext()Landroid/content/Context;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v1, v3}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/dao/utils/BlankBase;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 599
    .end local v1    # "con":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<+Lcom/blank/bm15/dao/utils/BlankBase;>;"
    :goto_0
    return-object v0

    .line 596
    :catch_0
    move-exception v2

    .line 597
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 599
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static delete(Lcom/blank/bm15/dao/utils/BlankBase;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/blank/bm15/dao/utils/BlankBase;",
            ">(TT;)V"
        }
    .end annotation

    .prologue
    .line 252
    .local p0, "obj":Lcom/blank/bm15/dao/utils/BlankBase;, "TT;"
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDao;->openDatabase(Lcom/blank/bm15/dao/utils/BlankBase;)Lcom/blank/bm15/dao/BlankDatabaseManagement;

    move-result-object v0

    .line 255
    .local v0, "database":Lcom/blank/bm15/dao/BlankDatabaseManagement;
    if-eqz p0, :cond_0

    :try_start_0
    invoke-virtual {p0}, Lcom/blank/bm15/dao/utils/BlankBase;->getId()Ljava/lang/Integer;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 256
    invoke-virtual {v0}, Lcom/blank/bm15/dao/BlankDatabaseManagement;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDao;->getTableName(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "id = "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/blank/bm15/dao/utils/BlankBase;->getId()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v2, v3, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 261
    :cond_0
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    .line 263
    :goto_0
    return-void

    .line 258
    :catch_0
    move-exception v1

    .line 259
    .local v1, "e":Ljava/lang/Exception;
    :try_start_1
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDao;->getTableName(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 261
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    goto :goto_0

    .line 260
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v2

    .line 261
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    .line 262
    throw v2
.end method

.method public static deleteAll(Ljava/util/List;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/blank/bm15/dao/utils/BlankBase;",
            ">(",
            "Ljava/util/List",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .local p0, "list":Ljava/util/List;, "Ljava/util/List<TT;>;"
    const/4 v6, 0x0

    .line 224
    if-eqz p0, :cond_1

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_1

    .line 225
    invoke-interface {p0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/blank/bm15/dao/utils/BlankBase;

    invoke-static {v5}, Lcom/blank/bm15/dao/BlankDao;->openDatabase(Lcom/blank/bm15/dao/utils/BlankBase;)Lcom/blank/bm15/dao/BlankDatabaseManagement;

    move-result-object v0

    .line 226
    .local v0, "database":Lcom/blank/bm15/dao/BlankDatabaseManagement;
    invoke-virtual {v0}, Lcom/blank/bm15/dao/BlankDatabaseManagement;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v4

    .line 227
    .local v4, "writableDatabase":Landroid/database/sqlite/SQLiteDatabase;
    invoke-interface {p0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/blank/bm15/dao/utils/BlankBase;

    invoke-static {v5}, Lcom/blank/bm15/dao/BlankDao;->getTableName(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;

    move-result-object v3

    .line 230
    .local v3, "tableName":Ljava/lang/String;
    :try_start_0
    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 231
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_0
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_2

    .line 236
    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 240
    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 241
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    .line 244
    .end local v0    # "database":Lcom/blank/bm15/dao/BlankDatabaseManagement;
    .end local v3    # "tableName":Ljava/lang/String;
    .end local v4    # "writableDatabase":Landroid/database/sqlite/SQLiteDatabase;
    :cond_1
    :goto_1
    return-void

    .line 231
    .restart local v0    # "database":Lcom/blank/bm15/dao/BlankDatabaseManagement;
    .restart local v3    # "tableName":Ljava/lang/String;
    .restart local v4    # "writableDatabase":Landroid/database/sqlite/SQLiteDatabase;
    :cond_2
    :try_start_1
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/blank/bm15/dao/utils/BlankBase;

    .line 232
    .local v2, "obj":Lcom/blank/bm15/dao/utils/BlankBase;, "TT;"
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lcom/blank/bm15/dao/utils/BlankBase;->getId()Ljava/lang/Integer;

    move-result-object v6

    if-eqz v6, :cond_0

    .line 233
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "id = "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Lcom/blank/bm15/dao/utils/BlankBase;->getId()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v4, v3, v6, v7}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 237
    .end local v2    # "obj":Lcom/blank/bm15/dao/utils/BlankBase;, "TT;"
    :catch_0
    move-exception v1

    .line 238
    .local v1, "e":Ljava/lang/Exception;
    const/4 v5, 0x0

    :try_start_2
    invoke-interface {p0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/blank/bm15/dao/utils/BlankBase;

    invoke-static {v5}, Lcom/blank/bm15/dao/BlankDao;->getTableName(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 240
    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 241
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    goto :goto_1

    .line 239
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v5

    .line 240
    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 241
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    .line 242
    throw v5
.end method

.method public static exportToCSV(Ljava/util/List;)V
    .locals 23
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/blank/bm15/dao/utils/BlankBase;",
            ">(",
            "Ljava/util/List",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 510
    .local p0, "list":Ljava/util/List;, "Ljava/util/List<TT;>;"
    invoke-interface/range {p0 .. p0}, Ljava/util/List;->isEmpty()Z

    move-result v20

    if-nez v20, :cond_2

    .line 511
    const/16 v20, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/blank/bm15/dao/utils/BlankBase;

    .line 512
    .local v14, "obj":Lcom/blank/bm15/dao/utils/BlankBase;, "TT;"
    invoke-static {v14}, Lcom/blank/bm15/dao/BlankDao;->getOrderedFields(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v10

    .line 513
    .local v10, "fields":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Field;>;"
    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v7

    .line 515
    .local v7, "colCount":I
    new-instance v20, Ljava/lang/StringBuilder;

    invoke-static {v14}, Lcom/blank/bm15/dao/BlankDao;->getTableName(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v21 .. v21}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    invoke-direct/range {v20 .. v21}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v21, ".csv"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 516
    .local v11, "fileName":Ljava/lang/String;
    invoke-virtual {v14}, Lcom/blank/bm15/dao/utils/BlankBase;->getContext()Landroid/content/Context;

    move-result-object v20

    invoke-virtual {v14}, Lcom/blank/bm15/dao/utils/BlankBase;->getContext()Landroid/content/Context;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v21

    move-object/from16 v0, v21

    iget v0, v0, Landroid/content/pm/ApplicationInfo;->labelRes:I

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v17

    .line 518
    .local v17, "subfolder":Ljava/lang/String;
    const/4 v5, 0x0

    .line 520
    .local v5, "bfw":Ljava/io/BufferedWriter;
    new-instance v16, Ljava/io/File;

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "/"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v16

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 521
    .local v16, "sdCardDir":Ljava/io/File;
    invoke-virtual/range {v16 .. v16}, Ljava/io/File;->exists()Z

    move-result v20

    if-nez v20, :cond_0

    .line 522
    invoke-virtual/range {v16 .. v16}, Ljava/io/File;->mkdir()Z

    .line 525
    :cond_0
    new-instance v15, Ljava/io/File;

    move-object/from16 v0, v16

    invoke-direct {v15, v0, v11}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 526
    .local v15, "saveFile":Ljava/io/File;
    invoke-virtual {v15}, Ljava/io/File;->exists()Z

    move-result v20

    if-eqz v20, :cond_1

    .line 527
    invoke-virtual {v15}, Ljava/io/File;->delete()Z

    .line 528
    new-instance v15, Ljava/io/File;

    .end local v15    # "saveFile":Ljava/io/File;
    move-object/from16 v0, v16

    invoke-direct {v15, v0, v11}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 532
    .restart local v15    # "saveFile":Ljava/io/File;
    :cond_1
    :try_start_0
    new-instance v6, Ljava/io/BufferedWriter;

    new-instance v20, Ljava/io/OutputStreamWriter;

    new-instance v21, Ljava/io/FileOutputStream;

    const/16 v22, 0x1

    move-object/from16 v0, v21

    move/from16 v1, v22

    invoke-direct {v0, v15, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V

    invoke-direct/range {v20 .. v21}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    move-object/from16 v0, v20

    invoke-direct {v6, v0}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 534
    .end local v5    # "bfw":Ljava/io/BufferedWriter;
    .local v6, "bfw":Ljava/io/BufferedWriter;
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_0
    if-lt v12, v7, :cond_3

    .line 545
    :try_start_1
    invoke-virtual {v6}, Ljava/io/BufferedWriter;->newLine()V

    .line 547
    invoke-interface/range {p0 .. p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v20

    :goto_1
    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-nez v21, :cond_5

    .line 566
    invoke-virtual {v14}, Lcom/blank/bm15/dao/utils/BlankBase;->getContext()Landroid/content/Context;

    move-result-object v20

    invoke-virtual {v14}, Lcom/blank/bm15/dao/utils/BlankBase;->getContext()Landroid/content/Context;

    move-result-object v21

    const v22, 0x7f050057

    invoke-virtual/range {v21 .. v22}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v21

    const/16 v22, 0x0

    invoke-static/range {v20 .. v22}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v18

    .line 567
    .local v18, "toast":Landroid/widget/Toast;
    const/16 v20, 0x11

    const/16 v21, 0x0

    const/16 v22, 0x0

    move-object/from16 v0, v18

    move/from16 v1, v20

    move/from16 v2, v21

    move/from16 v3, v22

    invoke-virtual {v0, v1, v2, v3}, Landroid/widget/Toast;->setGravity(III)V

    .line 568
    invoke-virtual/range {v18 .. v18}, Landroid/widget/Toast;->show()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 572
    if-eqz v6, :cond_2

    .line 574
    :try_start_2
    invoke-virtual {v6}, Ljava/io/BufferedWriter;->flush()V

    .line 575
    invoke-virtual {v6}, Ljava/io/BufferedWriter;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3

    .line 582
    .end local v6    # "bfw":Ljava/io/BufferedWriter;
    .end local v7    # "colCount":I
    .end local v10    # "fields":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Field;>;"
    .end local v11    # "fileName":Ljava/lang/String;
    .end local v12    # "i":I
    .end local v14    # "obj":Lcom/blank/bm15/dao/utils/BlankBase;, "TT;"
    .end local v15    # "saveFile":Ljava/io/File;
    .end local v16    # "sdCardDir":Ljava/io/File;
    .end local v17    # "subfolder":Ljava/lang/String;
    .end local v18    # "toast":Landroid/widget/Toast;
    :cond_2
    :goto_2
    return-void

    .line 535
    .restart local v6    # "bfw":Ljava/io/BufferedWriter;
    .restart local v7    # "colCount":I
    .restart local v10    # "fields":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Field;>;"
    .restart local v11    # "fileName":Ljava/lang/String;
    .restart local v12    # "i":I
    .restart local v14    # "obj":Lcom/blank/bm15/dao/utils/BlankBase;, "TT;"
    .restart local v15    # "saveFile":Ljava/io/File;
    .restart local v16    # "sdCardDir":Ljava/io/File;
    .restart local v17    # "subfolder":Ljava/lang/String;
    :cond_3
    :try_start_3
    invoke-interface {v10, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/reflect/Field;

    .line 536
    .local v9, "field":Ljava/lang/reflect/Field;
    sget-object v20, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v20

    move/from16 v0, v20

    invoke-virtual {v9, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 537
    invoke-virtual {v9}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v13

    .line 539
    .local v13, "name":Ljava/lang/String;
    add-int/lit8 v20, v7, -0x1

    move/from16 v0, v20

    if-eq v12, v0, :cond_4

    .line 540
    new-instance v20, Ljava/lang/StringBuilder;

    invoke-static {v13}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    invoke-direct/range {v20 .. v21}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/16 v21, 0x3b

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v6, v0}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 534
    :goto_3
    add-int/lit8 v12, v12, 0x1

    goto :goto_0

    .line 542
    :cond_4
    invoke-virtual {v6, v13}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_3

    .line 569
    .end local v9    # "field":Ljava/lang/reflect/Field;
    .end local v13    # "name":Ljava/lang/String;
    :catch_0
    move-exception v8

    move-object v5, v6

    .line 570
    .end local v6    # "bfw":Ljava/io/BufferedWriter;
    .end local v12    # "i":I
    .restart local v5    # "bfw":Ljava/io/BufferedWriter;
    .local v8, "e":Ljava/lang/Exception;
    :goto_4
    :try_start_4
    invoke-static {v14}, Lcom/blank/bm15/dao/BlankDao;->getTableName(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;

    move-result-object v20

    invoke-virtual {v8}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 572
    if-eqz v5, :cond_2

    .line 574
    :try_start_5
    invoke-virtual {v5}, Ljava/io/BufferedWriter;->flush()V

    .line 575
    invoke-virtual {v5}, Ljava/io/BufferedWriter;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    goto :goto_2

    .line 576
    :catch_1
    move-exception v8

    .line 577
    .local v8, "e":Ljava/io/IOException;
    invoke-static {v14}, Lcom/blank/bm15/dao/BlankDao;->getTableName(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;

    move-result-object v20

    invoke-virtual {v8}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 547
    .end local v5    # "bfw":Ljava/io/BufferedWriter;
    .end local v8    # "e":Ljava/io/IOException;
    .restart local v6    # "bfw":Ljava/io/BufferedWriter;
    .restart local v12    # "i":I
    :cond_5
    :try_start_6
    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/blank/bm15/dao/utils/BlankBase;

    .line 548
    .local v4, "aux":Lcom/blank/bm15/dao/utils/BlankBase;, "TT;"
    const/4 v12, 0x0

    :goto_5
    if-lt v12, v7, :cond_7

    .line 563
    invoke-virtual {v6}, Ljava/io/BufferedWriter;->newLine()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto/16 :goto_1

    .line 571
    .end local v4    # "aux":Lcom/blank/bm15/dao/utils/BlankBase;, "TT;"
    :catchall_0
    move-exception v20

    move-object v5, v6

    .line 572
    .end local v6    # "bfw":Ljava/io/BufferedWriter;
    .end local v12    # "i":I
    .restart local v5    # "bfw":Ljava/io/BufferedWriter;
    :goto_6
    if-eqz v5, :cond_6

    .line 574
    :try_start_7
    invoke-virtual {v5}, Ljava/io/BufferedWriter;->flush()V

    .line 575
    invoke-virtual {v5}, Ljava/io/BufferedWriter;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_2

    .line 580
    :cond_6
    :goto_7
    throw v20

    .line 549
    .end local v5    # "bfw":Ljava/io/BufferedWriter;
    .restart local v4    # "aux":Lcom/blank/bm15/dao/utils/BlankBase;, "TT;"
    .restart local v6    # "bfw":Ljava/io/BufferedWriter;
    .restart local v12    # "i":I
    :cond_7
    :try_start_8
    invoke-interface {v10, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/reflect/Field;

    .line 550
    .restart local v9    # "field":Ljava/lang/reflect/Field;
    sget-object v21, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual/range {v21 .. v21}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v21

    move/from16 v0, v21

    invoke-virtual {v9, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 551
    invoke-virtual {v9, v4}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v19

    .line 553
    .local v19, "value":Ljava/lang/Object;
    if-eqz v19, :cond_8

    const-class v21, Lcom/blank/bm15/dao/utils/BlankBase;

    invoke-virtual {v9}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v21

    if-eqz v21, :cond_8

    .line 554
    check-cast v19, Lcom/blank/bm15/dao/utils/BlankBase;

    .end local v19    # "value":Ljava/lang/Object;
    invoke-virtual/range {v19 .. v19}, Lcom/blank/bm15/dao/utils/BlankBase;->getId()Ljava/lang/Integer;

    move-result-object v19

    .line 557
    :cond_8
    add-int/lit8 v21, v7, -0x1

    move/from16 v0, v21

    if-eq v12, v0, :cond_9

    .line 558
    new-instance v21, Ljava/lang/StringBuilder;

    invoke-static/range {v19 .. v19}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v22 .. v22}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v22

    invoke-direct/range {v21 .. v22}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/16 v22, 0x3b

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v6, v0}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 548
    :goto_8
    add-int/lit8 v12, v12, 0x1

    goto :goto_5

    .line 560
    :cond_9
    invoke-static/range {v19 .. v19}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v6, v0}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_0
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    goto :goto_8

    .line 576
    .end local v4    # "aux":Lcom/blank/bm15/dao/utils/BlankBase;, "TT;"
    .end local v6    # "bfw":Ljava/io/BufferedWriter;
    .end local v9    # "field":Ljava/lang/reflect/Field;
    .end local v12    # "i":I
    .restart local v5    # "bfw":Ljava/io/BufferedWriter;
    :catch_2
    move-exception v8

    .line 577
    .restart local v8    # "e":Ljava/io/IOException;
    invoke-static {v14}, Lcom/blank/bm15/dao/BlankDao;->getTableName(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;

    move-result-object v21

    invoke-virtual {v8}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_7

    .line 576
    .end local v5    # "bfw":Ljava/io/BufferedWriter;
    .end local v8    # "e":Ljava/io/IOException;
    .restart local v6    # "bfw":Ljava/io/BufferedWriter;
    .restart local v12    # "i":I
    .restart local v18    # "toast":Landroid/widget/Toast;
    :catch_3
    move-exception v8

    .line 577
    .restart local v8    # "e":Ljava/io/IOException;
    invoke-static {v14}, Lcom/blank/bm15/dao/BlankDao;->getTableName(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;

    move-result-object v20

    invoke-virtual {v8}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    .line 571
    .end local v6    # "bfw":Ljava/io/BufferedWriter;
    .end local v8    # "e":Ljava/io/IOException;
    .end local v12    # "i":I
    .end local v18    # "toast":Landroid/widget/Toast;
    .restart local v5    # "bfw":Ljava/io/BufferedWriter;
    :catchall_1
    move-exception v20

    goto :goto_6

    .line 569
    :catch_4
    move-exception v8

    goto/16 :goto_4
.end method

.method public static get(Lcom/blank/bm15/dao/utils/BlankBase;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/blank/bm15/dao/utils/BlankBase;",
            ">(TT;)V"
        }
    .end annotation

    .prologue
    .line 163
    .local p0, "obj":Lcom/blank/bm15/dao/utils/BlankBase;, "TT;"
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDao;->openDatabase(Lcom/blank/bm15/dao/utils/BlankBase;)Lcom/blank/bm15/dao/BlankDatabaseManagement;

    move-result-object v1

    .line 164
    .local v1, "database":Lcom/blank/bm15/dao/BlankDatabaseManagement;
    const/4 v0, 0x0

    .line 167
    .local v0, "c":Landroid/database/Cursor;
    :try_start_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDao;->getQuerySelect(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDao;->getQueryWhere(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 168
    .local v3, "query":Ljava/lang/String;
    invoke-virtual {v1}, Lcom/blank/bm15/dao/BlankDatabaseManagement;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, v3, v5}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 169
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 170
    invoke-static {v0, p0}, Lcom/blank/bm15/dao/BlankDao;->putCursorValuesInObject(Landroid/database/Cursor;Lcom/blank/bm15/dao/utils/BlankBase;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 177
    :goto_0
    if-eqz v0, :cond_0

    .line 178
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 180
    :cond_0
    invoke-static {v1}, Lcom/blank/bm15/dao/BlankDao;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    .line 182
    .end local v3    # "query":Ljava/lang/String;
    :goto_1
    return-void

    .line 172
    .restart local v3    # "query":Ljava/lang/String;
    :cond_1
    const/4 v4, 0x0

    :try_start_1
    invoke-virtual {p0, v4}, Lcom/blank/bm15/dao/utils/BlankBase;->setId(Ljava/lang/Integer;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 174
    .end local v3    # "query":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 175
    .local v2, "e":Ljava/lang/Exception;
    :try_start_2
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDao;->getTableName(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 177
    if-eqz v0, :cond_2

    .line 178
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 180
    :cond_2
    invoke-static {v1}, Lcom/blank/bm15/dao/BlankDao;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    goto :goto_1

    .line 176
    .end local v2    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v4

    .line 177
    if-eqz v0, :cond_3

    .line 178
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 180
    :cond_3
    invoke-static {v1}, Lcom/blank/bm15/dao/BlankDao;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    .line 181
    throw v4
.end method

.method public static getAll(Landroid/database/sqlite/SQLiteDatabase;Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;
    .locals 6
    .param p0, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/blank/bm15/dao/utils/BlankBase;",
            ">(",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "TT;)",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 41
    .local p1, "obj":Lcom/blank/bm15/dao/utils/BlankBase;, "TT;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 42
    .local v3, "list":Ljava/util/List;, "Ljava/util/List<TT;>;"
    const/4 v1, 0x0

    .line 46
    .local v1, "c":Landroid/database/Cursor;
    :try_start_0
    invoke-static {p1}, Lcom/blank/bm15/dao/BlankDao;->getQuerySelect(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {p0, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 47
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 49
    :cond_0
    invoke-static {p1}, Lcom/blank/bm15/dao/BlankDao;->createNewInstance(Lcom/blank/bm15/dao/utils/BlankBase;)Lcom/blank/bm15/dao/utils/BlankBase;

    move-result-object v0

    .line 50
    .local v0, "aux":Lcom/blank/bm15/dao/utils/BlankBase;, "TT;"
    invoke-static {v1, v0}, Lcom/blank/bm15/dao/BlankDao;->putCursorValuesInObject(Landroid/database/Cursor;Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 51
    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 52
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v4

    if-nez v4, :cond_0

    .line 57
    .end local v0    # "aux":Lcom/blank/bm15/dao/utils/BlankBase;, "TT;"
    :cond_1
    if-eqz v1, :cond_2

    .line 58
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 62
    :cond_2
    :goto_0
    return-object v3

    .line 54
    :catch_0
    move-exception v2

    .line 55
    .local v2, "e":Ljava/lang/Exception;
    :try_start_1
    invoke-static {p1}, Lcom/blank/bm15/dao/BlankDao;->getTableName(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 57
    if-eqz v1, :cond_2

    .line 58
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    goto :goto_0

    .line 56
    .end local v2    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v4

    .line 57
    if-eqz v1, :cond_3

    .line 58
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 60
    :cond_3
    throw v4
.end method

.method public static getAll(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/blank/bm15/dao/utils/BlankBase;",
            ">(TT;)",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 72
    .local p0, "obj":Lcom/blank/bm15/dao/utils/BlankBase;, "TT;"
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDao;->openDatabase(Lcom/blank/bm15/dao/utils/BlankBase;)Lcom/blank/bm15/dao/BlankDatabaseManagement;

    move-result-object v0

    .line 73
    .local v0, "database":Lcom/blank/bm15/dao/BlankDatabaseManagement;
    const/4 v3, 0x0

    .line 77
    .local v3, "list":Ljava/util/List;, "Ljava/util/List<TT;>;"
    :try_start_0
    invoke-virtual {v0}, Lcom/blank/bm15/dao/BlankDatabaseManagement;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 78
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    invoke-static {v1, p0}, Lcom/blank/bm15/dao/BlankDao;->getAll(Landroid/database/sqlite/SQLiteDatabase;Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v3

    .line 82
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    .line 85
    .end local v1    # "db":Landroid/database/sqlite/SQLiteDatabase;
    :goto_0
    return-object v3

    .line 79
    :catch_0
    move-exception v2

    .line 80
    .local v2, "e":Ljava/lang/Exception;
    :try_start_1
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDao;->getTableName(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 82
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    goto :goto_0

    .line 81
    .end local v2    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v4

    .line 82
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    .line 83
    throw v4
.end method

.method protected static getContentValues(Lcom/blank/bm15/dao/utils/BlankBase;)Landroid/content/ContentValues;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/blank/bm15/dao/utils/BlankBase;",
            ">(TT;)",
            "Landroid/content/ContentValues;"
        }
    .end annotation

    .prologue
    .line 697
    .local p0, "obj":Lcom/blank/bm15/dao/utils/BlankBase;, "TT;"
    const/4 v5, 0x0

    .line 699
    .local v5, "values":Landroid/content/ContentValues;
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDao;->getOrderedFields(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v2

    .line 700
    .local v2, "fields":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Field;>;"
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_1

    .line 701
    new-instance v5, Landroid/content/ContentValues;

    .end local v5    # "values":Landroid/content/ContentValues;
    invoke-direct {v5}, Landroid/content/ContentValues;-><init>()V

    .line 703
    .restart local v5    # "values":Landroid/content/ContentValues;
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_0
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-nez v7, :cond_2

    .line 733
    :cond_1
    return-object v5

    .line 703
    :cond_2
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/reflect/Field;

    .line 704
    .local v1, "field":Ljava/lang/reflect/Field;
    sget-object v7, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    invoke-virtual {v1, v7}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 707
    :try_start_0
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v3

    .line 708
    .local v3, "name":Ljava/lang/String;
    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 709
    .local v4, "value":Ljava/lang/Object;
    if-nez v4, :cond_3

    .line 710
    invoke-virtual {v5, v3}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 727
    .end local v3    # "name":Ljava/lang/String;
    .end local v4    # "value":Ljava/lang/Object;
    :catch_0
    move-exception v0

    .line 728
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDao;->getTableName(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 711
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v3    # "name":Ljava/lang/String;
    .restart local v4    # "value":Ljava/lang/Object;
    :cond_3
    :try_start_1
    instance-of v7, v4, Ljava/lang/Boolean;

    if-eqz v7, :cond_4

    .line 712
    invoke-static {v4}, Lcom/blank/bm15/dao/utils/BlankObj;->toBoolean(Ljava/lang/Object;)Ljava/lang/Boolean;

    move-result-object v7

    invoke-virtual {v5, v3, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    goto :goto_0

    .line 713
    :cond_4
    instance-of v7, v4, Ljava/lang/String;

    if-eqz v7, :cond_5

    .line 714
    invoke-static {v4}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v3, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 715
    :cond_5
    instance-of v7, v4, Ljava/lang/Integer;

    if-eqz v7, :cond_6

    .line 716
    invoke-static {v4}, Lcom/blank/bm15/dao/utils/BlankObj;->toInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v5, v3, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    goto :goto_0

    .line 717
    :cond_6
    instance-of v7, v4, Ljava/lang/Long;

    if-eqz v7, :cond_7

    .line 718
    invoke-static {v4}, Lcom/blank/bm15/dao/utils/BlankObj;->toLong(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v5, v3, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    goto :goto_0

    .line 719
    :cond_7
    instance-of v7, v4, Ljava/lang/Double;

    if-eqz v7, :cond_8

    .line 720
    invoke-static {v4}, Lcom/blank/bm15/dao/utils/BlankObj;->toDouble(Ljava/lang/Object;)Ljava/lang/Double;

    move-result-object v7

    invoke-virtual {v5, v3, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    goto :goto_0

    .line 721
    :cond_8
    instance-of v7, v4, Ljava/lang/Float;

    if-eqz v7, :cond_9

    .line 722
    invoke-static {v4}, Lcom/blank/bm15/dao/utils/BlankObj;->toFloat(Ljava/lang/Object;)Ljava/lang/Float;

    move-result-object v7

    invoke-virtual {v5, v3, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Float;)V

    goto :goto_0

    .line 723
    :cond_9
    instance-of v7, v4, Lcom/blank/bm15/dao/utils/BlankBase;

    if-eqz v7, :cond_0

    .line 724
    check-cast v4, Lcom/blank/bm15/dao/utils/BlankBase;

    .end local v4    # "value":Ljava/lang/Object;
    invoke-virtual {v4}, Lcom/blank/bm15/dao/utils/BlankBase;->getId()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v5, v3, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0
.end method

.method protected static getInheritedFields(Ljava/lang/Class;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/util/List",
            "<",
            "Ljava/lang/reflect/Field;",
            ">;"
        }
    .end annotation

    .prologue
    .line 650
    .local p0, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 652
    .local v2, "fields":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Field;>;"
    move-object v1, p0

    .local v1, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_0
    if-nez v1, :cond_1

    .line 671
    :cond_0
    return-object v2

    .line 653
    :cond_1
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    const-class v5, Lcom/blank/bm15/dao/utils/BlankBase;

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 654
    invoke-virtual {v1}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v0

    .line 655
    .local v0, "aux":[Ljava/lang/reflect/Field;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    array-length v4, v0

    if-ge v3, v4, :cond_0

    .line 656
    aget-object v4, v0, v3

    invoke-virtual {v4}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "id"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 657
    aget-object v4, v0, v3

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 655
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 662
    .end local v0    # "aux":[Ljava/lang/reflect/Field;
    .end local v3    # "i":I
    :cond_3
    invoke-virtual {v1}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v0

    .line 663
    .restart local v0    # "aux":[Ljava/lang/reflect/Field;
    const/4 v3, 0x0

    .restart local v3    # "i":I
    :goto_2
    array-length v4, v0

    if-lt v3, v4, :cond_4

    .line 652
    invoke-virtual {v1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v1

    goto :goto_0

    .line 664
    :cond_4
    aget-object v4, v0, v3

    invoke-virtual {v4}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "temp"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_5

    .line 665
    aget-object v4, v0, v3

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 663
    :cond_5
    add-int/lit8 v3, v3, 0x1

    goto :goto_2
.end method

.method public static getOrderedFields(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/blank/bm15/dao/utils/BlankBase;",
            ">(TT;)",
            "Ljava/util/List",
            "<",
            "Ljava/lang/reflect/Field;",
            ">;"
        }
    .end annotation

    .prologue
    .line 638
    .local p0, "obj":Lcom/blank/bm15/dao/utils/BlankBase;, "TT;"
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1}, Lcom/blank/bm15/dao/BlankDao;->getInheritedFields(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    .line 639
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Field;>;"
    new-instance v1, Lcom/blank/bm15/dao/utils/BlankOrderFieldsByName;

    invoke-direct {v1}, Lcom/blank/bm15/dao/utils/BlankOrderFieldsByName;-><init>()V

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 640
    return-object v0
.end method

.method public static getQueryCreate(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/blank/bm15/dao/utils/BlankBase;",
            ">(TT;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 354
    .local p0, "obj":Lcom/blank/bm15/dao/utils/BlankBase;, "TT;"
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "CREATE TABLE IF NOT EXISTS "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDao;->getTableName(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " ( "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 356
    .local v1, "create":Ljava/lang/String;
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDao;->getOrderedFields(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v2

    .line 357
    .local v2, "fields":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Field;>;"
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    if-lt v3, v4, :cond_0

    .line 374
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, " )"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 376
    return-object v1

    .line 358
    :cond_0
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/reflect/Field;

    invoke-virtual {v4}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v0

    .line 359
    .local v0, "column":Ljava/lang/String;
    const-string v4, "id"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 360
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, " INTEGER PRIMARY KEY AUTOINCREMENT "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 368
    :cond_1
    :goto_1
    if-nez v3, :cond_7

    .line 369
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 357
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 361
    :cond_2
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/reflect/Field;

    invoke-virtual {v4}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v4

    const-class v5, Ljava/lang/Integer;

    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/reflect/Field;

    invoke-virtual {v4}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v4

    const-class v5, Ljava/lang/Long;

    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    const-class v5, Lcom/blank/bm15/dao/utils/BlankBase;

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/reflect/Field;

    invoke-virtual {v4}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 362
    :cond_3
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, " INTEGER "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 363
    goto :goto_1

    :cond_4
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/reflect/Field;

    invoke-virtual {v4}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v4

    const-class v5, Ljava/lang/Float;

    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_5

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/reflect/Field;

    invoke-virtual {v4}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v4

    const-class v5, Ljava/lang/Double;

    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 364
    :cond_5
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, " REAL "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 365
    goto/16 :goto_1

    :cond_6
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/reflect/Field;

    invoke-virtual {v4}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v4

    const-class v5, Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 366
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, " TEXT "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_1

    .line 371
    :cond_7
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_2
.end method

.method public static getQueryDelete(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/blank/bm15/dao/utils/BlankBase;",
            ">(TT;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 386
    .local p0, "obj":Lcom/blank/bm15/dao/utils/BlankBase;, "TT;"
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "DROP TABLE IF EXISTS "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDao;->getTableName(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getQuerySelect(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/blank/bm15/dao/utils/BlankBase;",
            ">(TT;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 395
    .local p0, "obj":Lcom/blank/bm15/dao/utils/BlankBase;, "TT;"
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "SELECT * FROM "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDao;->getTableName(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getQueryWhere(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/blank/bm15/dao/utils/BlankBase;",
            ">(TT;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 405
    .local p0, "obj":Lcom/blank/bm15/dao/utils/BlankBase;, "TT;"
    const-string v8, ""

    .line 407
    .local v8, "where":Ljava/lang/String;
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDao;->getOrderedFields(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v4

    .line 408
    .local v4, "fields":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Field;>;"
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v9

    if-lt v5, v9, :cond_0

    .line 441
    return-object v8

    .line 410
    :cond_0
    :try_start_0
    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/reflect/Field;

    .line 411
    .local v1, "field":Ljava/lang/reflect/Field;
    sget-object v9, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v9}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v9

    invoke-virtual {v1, v9}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 413
    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    if-eqz v9, :cond_1

    .line 414
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v2

    .line 415
    .local v2, "fieldName":Ljava/lang/String;
    const/4 v3, 0x0

    .line 417
    .local v3, "fieldValue":Ljava/lang/String;
    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    .line 418
    .local v7, "value":Ljava/lang/Object;
    instance-of v9, v7, Ljava/lang/String;

    if-eqz v9, :cond_2

    .line 419
    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "\'"

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v7}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "\'"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 431
    .end local v7    # "value":Ljava/lang/Object;
    :goto_1
    const-string v9, ""

    invoke-virtual {v9, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 432
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v10, " WHERE "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 408
    .end local v1    # "field":Ljava/lang/reflect/Field;
    .end local v2    # "fieldName":Ljava/lang/String;
    .end local v3    # "fieldValue":Ljava/lang/String;
    :cond_1
    :goto_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 420
    .restart local v1    # "field":Ljava/lang/reflect/Field;
    .restart local v2    # "fieldName":Ljava/lang/String;
    .restart local v3    # "fieldValue":Ljava/lang/String;
    .restart local v7    # "value":Ljava/lang/Object;
    :cond_2
    instance-of v9, v7, Lcom/blank/bm15/dao/utils/BlankBase;

    if-eqz v9, :cond_3

    .line 421
    check-cast v7, Lcom/blank/bm15/dao/utils/BlankBase;

    .end local v7    # "value":Ljava/lang/Object;
    invoke-virtual {v7}, Lcom/blank/bm15/dao/utils/BlankBase;->getId()Ljava/lang/Integer;

    move-result-object v6

    .line 422
    .local v6, "id":Ljava/lang/Integer;
    if-eqz v6, :cond_1

    .line 423
    invoke-static {v6}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 427
    goto :goto_1

    .line 428
    .end local v6    # "id":Ljava/lang/Integer;
    .restart local v7    # "value":Ljava/lang/Object;
    :cond_3
    invoke-static {v7}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    goto :goto_1

    .line 434
    .end local v7    # "value":Ljava/lang/Object;
    :cond_4
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v10, " AND "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v8

    goto :goto_2

    .line 437
    .end local v1    # "field":Ljava/lang/reflect/Field;
    .end local v2    # "fieldName":Ljava/lang/String;
    .end local v3    # "fieldValue":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 438
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDao;->getTableName(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2
.end method

.method public static getQueryWhereLike(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/blank/bm15/dao/utils/BlankBase;",
            ">(TT;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 451
    .local p0, "obj":Lcom/blank/bm15/dao/utils/BlankBase;, "TT;"
    const-string v7, ""

    .line 453
    .local v7, "where":Ljava/lang/String;
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDao;->getOrderedFields(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v4

    .line 454
    .local v4, "fields":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Field;>;"
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v8

    if-lt v5, v8, :cond_0

    .line 481
    return-object v7

    .line 456
    :cond_0
    :try_start_0
    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/reflect/Field;

    .line 457
    .local v1, "field":Ljava/lang/reflect/Field;
    sget-object v8, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v8

    invoke-virtual {v1, v8}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 459
    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_1

    .line 460
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v2

    .line 461
    .local v2, "fieldName":Ljava/lang/String;
    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .line 463
    .local v6, "value":Ljava/lang/Object;
    const-string v3, ""

    .line 464
    .local v3, "fieldValue":Ljava/lang/String;
    instance-of v8, v6, Lcom/blank/bm15/dao/utils/BlankBase;

    if-eqz v8, :cond_2

    .line 465
    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "\'%"

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    check-cast v6, Lcom/blank/bm15/dao/utils/BlankBase;

    .end local v6    # "value":Ljava/lang/Object;
    invoke-virtual {v6}, Lcom/blank/bm15/dao/utils/BlankBase;->getId()Ljava/lang/Integer;

    move-result-object v9

    invoke-static {v9}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "%\'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 471
    :goto_1
    const-string v8, ""

    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 472
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v9, " WHERE UPPER("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ") LIKE ("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ")"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 454
    .end local v1    # "field":Ljava/lang/reflect/Field;
    .end local v2    # "fieldName":Ljava/lang/String;
    .end local v3    # "fieldValue":Ljava/lang/String;
    :cond_1
    :goto_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 467
    .restart local v1    # "field":Ljava/lang/reflect/Field;
    .restart local v2    # "fieldName":Ljava/lang/String;
    .restart local v3    # "fieldValue":Ljava/lang/String;
    .restart local v6    # "value":Ljava/lang/Object;
    :cond_2
    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "\'%"

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v6}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "%\'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_1

    .line 474
    .end local v6    # "value":Ljava/lang/Object;
    :cond_3
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v9, " AND UPPER("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ") LIKE ("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ")"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v7

    goto :goto_2

    .line 477
    .end local v1    # "field":Ljava/lang/reflect/Field;
    .end local v2    # "fieldName":Ljava/lang/String;
    .end local v3    # "fieldValue":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 478
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDao;->getTableName(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2
.end method

.method public static getSome(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/blank/bm15/dao/utils/BlankBase;",
            ">(TT;)",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 95
    .local p0, "obj":Lcom/blank/bm15/dao/utils/BlankBase;, "TT;"
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDao;->openDatabase(Lcom/blank/bm15/dao/utils/BlankBase;)Lcom/blank/bm15/dao/BlankDatabaseManagement;

    move-result-object v2

    .line 96
    .local v2, "database":Lcom/blank/bm15/dao/BlankDatabaseManagement;
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 97
    .local v4, "list":Ljava/util/List;, "Ljava/util/List<TT;>;"
    const/4 v1, 0x0

    .line 101
    .local v1, "c":Landroid/database/Cursor;
    :try_start_0
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDao;->getQuerySelect(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDao;->getQueryWhere(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 102
    .local v5, "query":Ljava/lang/String;
    invoke-virtual {v2}, Lcom/blank/bm15/dao/BlankDatabaseManagement;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v6, v5, v7}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 103
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 105
    :cond_0
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDao;->createNewInstance(Lcom/blank/bm15/dao/utils/BlankBase;)Lcom/blank/bm15/dao/utils/BlankBase;

    move-result-object v0

    .line 106
    .local v0, "aux":Lcom/blank/bm15/dao/utils/BlankBase;, "TT;"
    invoke-static {v1, v0}, Lcom/blank/bm15/dao/BlankDao;->putCursorValuesInObject(Landroid/database/Cursor;Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 107
    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 108
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v6

    if-nez v6, :cond_0

    .line 113
    .end local v0    # "aux":Lcom/blank/bm15/dao/utils/BlankBase;, "TT;"
    :cond_1
    if-eqz v1, :cond_2

    .line 114
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 116
    :cond_2
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    .line 119
    .end local v5    # "query":Ljava/lang/String;
    :goto_0
    return-object v4

    .line 110
    :catch_0
    move-exception v3

    .line 111
    .local v3, "e":Ljava/lang/Exception;
    :try_start_1
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDao;->getTableName(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 113
    if-eqz v1, :cond_3

    .line 114
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 116
    :cond_3
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    goto :goto_0

    .line 112
    .end local v3    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v6

    .line 113
    if-eqz v1, :cond_4

    .line 114
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 116
    :cond_4
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    .line 117
    throw v6
.end method

.method public static getSomeLike(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/blank/bm15/dao/utils/BlankBase;",
            ">(TT;)",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 129
    .local p0, "obj":Lcom/blank/bm15/dao/utils/BlankBase;, "TT;"
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDao;->openDatabase(Lcom/blank/bm15/dao/utils/BlankBase;)Lcom/blank/bm15/dao/BlankDatabaseManagement;

    move-result-object v2

    .line 130
    .local v2, "database":Lcom/blank/bm15/dao/BlankDatabaseManagement;
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 131
    .local v4, "list":Ljava/util/List;, "Ljava/util/List<TT;>;"
    const/4 v1, 0x0

    .line 135
    .local v1, "c":Landroid/database/Cursor;
    :try_start_0
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDao;->getQuerySelect(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDao;->getQueryWhereLike(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 136
    .local v5, "query":Ljava/lang/String;
    invoke-virtual {v2}, Lcom/blank/bm15/dao/BlankDatabaseManagement;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v6, v5, v7}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 137
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 139
    :cond_0
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDao;->createNewInstance(Lcom/blank/bm15/dao/utils/BlankBase;)Lcom/blank/bm15/dao/utils/BlankBase;

    move-result-object v0

    .line 140
    .local v0, "aux":Lcom/blank/bm15/dao/utils/BlankBase;, "TT;"
    invoke-static {v1, v0}, Lcom/blank/bm15/dao/BlankDao;->putCursorValuesInObject(Landroid/database/Cursor;Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 141
    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 142
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v6

    if-nez v6, :cond_0

    .line 147
    .end local v0    # "aux":Lcom/blank/bm15/dao/utils/BlankBase;, "TT;"
    :cond_1
    if-eqz v1, :cond_2

    .line 148
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 150
    :cond_2
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    .line 153
    .end local v5    # "query":Ljava/lang/String;
    :goto_0
    return-object v4

    .line 144
    :catch_0
    move-exception v3

    .line 145
    .local v3, "e":Ljava/lang/Exception;
    :try_start_1
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDao;->getTableName(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 147
    if-eqz v1, :cond_3

    .line 148
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 150
    :cond_3
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    goto :goto_0

    .line 146
    .end local v3    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v6

    .line 147
    if-eqz v1, :cond_4

    .line 148
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 150
    :cond_4
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    .line 151
    throw v6
.end method

.method protected static getTableName(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/blank/bm15/dao/utils/BlankBase;",
            ">(TT;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 609
    .local p0, "obj":Lcom/blank/bm15/dao/utils/BlankBase;, "TT;"
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static insertDefaultRows(Landroid/database/sqlite/SQLiteDatabase;Ljava/util/List;)V
    .locals 5
    .param p0, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/blank/bm15/dao/utils/BlankBase;",
            ">(",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Ljava/util/List",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 488
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<TT;>;"
    if-eqz p1, :cond_1

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    .line 489
    const/4 v3, 0x0

    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/blank/bm15/dao/utils/BlankBase;

    invoke-static {v3}, Lcom/blank/bm15/dao/BlankDao;->getTableName(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;

    move-result-object v1

    .line 492
    .local v1, "tableName":Ljava/lang/String;
    if-eqz p1, :cond_1

    .line 494
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_2

    .line 502
    .end local v1    # "tableName":Ljava/lang/String;
    :cond_1
    return-void

    .line 494
    .restart local v1    # "tableName":Ljava/lang/String;
    :cond_2
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/dao/utils/BlankBase;

    .line 495
    .local v0, "obj":Lcom/blank/bm15/dao/utils/BlankBase;, "TT;"
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->getContentValues(Lcom/blank/bm15/dao/utils/BlankBase;)Landroid/content/ContentValues;

    move-result-object v2

    .line 496
    .local v2, "values":Landroid/content/ContentValues;
    if-eqz v2, :cond_0

    .line 497
    const/4 v4, 0x0

    invoke-virtual {p0, v1, v4, v2}, Landroid/database/sqlite/SQLiteDatabase;->insertOrThrow(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    goto :goto_0
.end method

.method public static loadById(Lcom/blank/bm15/dao/utils/BlankBase;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/blank/bm15/dao/utils/BlankBase;",
            ">(TT;)V"
        }
    .end annotation

    .prologue
    .line 191
    .local p0, "obj":Lcom/blank/bm15/dao/utils/BlankBase;, "TT;"
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDao;->openDatabase(Lcom/blank/bm15/dao/utils/BlankBase;)Lcom/blank/bm15/dao/BlankDatabaseManagement;

    move-result-object v1

    .line 192
    .local v1, "database":Lcom/blank/bm15/dao/BlankDatabaseManagement;
    const/4 v0, 0x0

    .line 195
    .local v0, "c":Landroid/database/Cursor;
    if-eqz p0, :cond_0

    :try_start_0
    invoke-virtual {p0}, Lcom/blank/bm15/dao/utils/BlankBase;->getId()Ljava/lang/Integer;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 196
    invoke-virtual {p0}, Lcom/blank/bm15/dao/utils/BlankBase;->getId()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 197
    .local v3, "id":I
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDao;->resetObject(Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 198
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/blank/bm15/dao/utils/BlankBase;->setId(Ljava/lang/Integer;)V

    .line 201
    invoke-virtual {v1}, Lcom/blank/bm15/dao/BlankDatabaseManagement;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDao;->getQuerySelect(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDao;->getQueryWhere(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 202
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 203
    invoke-static {v0, p0}, Lcom/blank/bm15/dao/BlankDao;->putCursorValuesInObject(Landroid/database/Cursor;Lcom/blank/bm15/dao/utils/BlankBase;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 211
    .end local v3    # "id":I
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    .line 212
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 214
    :cond_1
    invoke-static {v1}, Lcom/blank/bm15/dao/BlankDao;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    .line 216
    :goto_1
    return-void

    .line 205
    .restart local v3    # "id":I
    :cond_2
    const/4 v4, 0x0

    :try_start_1
    invoke-virtual {p0, v4}, Lcom/blank/bm15/dao/utils/BlankBase;->setId(Ljava/lang/Integer;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 208
    .end local v3    # "id":I
    :catch_0
    move-exception v2

    .line 209
    .local v2, "e":Ljava/lang/Exception;
    :try_start_2
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDao;->getTableName(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 211
    if-eqz v0, :cond_3

    .line 212
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 214
    :cond_3
    invoke-static {v1}, Lcom/blank/bm15/dao/BlankDao;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    goto :goto_1

    .line 210
    .end local v2    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v4

    .line 211
    if-eqz v0, :cond_4

    .line 212
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 214
    :cond_4
    invoke-static {v1}, Lcom/blank/bm15/dao/BlankDao;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    .line 215
    throw v4
.end method

.method protected static openDatabase(Lcom/blank/bm15/dao/utils/BlankBase;)Lcom/blank/bm15/dao/BlankDatabaseManagement;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/blank/bm15/dao/utils/BlankBase;",
            ">(TT;)",
            "Lcom/blank/bm15/dao/BlankDatabaseManagement;"
        }
    .end annotation

    .prologue
    .line 618
    .local p0, "obj":Lcom/blank/bm15/dao/utils/BlankBase;, "TT;"
    new-instance v0, Lcom/blank/bm15/dao/BlankDatabaseManagement;

    invoke-virtual {p0}, Lcom/blank/bm15/dao/utils/BlankBase;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/blank/bm15/dao/BlankDatabaseManagement;-><init>(Landroid/content/Context;)V

    .line 619
    .local v0, "blankDatabaseManagement":Lcom/blank/bm15/dao/BlankDatabaseManagement;
    return-object v0
.end method

.method protected static putCursorValuesInObject(Landroid/database/Cursor;Lcom/blank/bm15/dao/utils/BlankBase;)V
    .locals 12
    .param p0, "c"    # Landroid/database/Cursor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/blank/bm15/dao/utils/BlankBase;",
            ">(",
            "Landroid/database/Cursor;",
            "TT;)V"
        }
    .end annotation

    .prologue
    .local p1, "obj":Lcom/blank/bm15/dao/utils/BlankBase;, "TT;"
    const/4 v9, 0x0

    .line 744
    invoke-static {p1}, Lcom/blank/bm15/dao/BlankDao;->getOrderedFields(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v6

    .line 746
    .local v6, "fields":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Field;>;"
    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_9

    .line 747
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_0
    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-nez v9, :cond_1

    .line 782
    invoke-virtual {p1}, Lcom/blank/bm15/dao/utils/BlankBase;->load()V

    .line 786
    :goto_1
    return-void

    .line 747
    :cond_1
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/reflect/Field;

    .line 748
    .local v5, "field":Ljava/lang/reflect/Field;
    sget-object v9, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v9}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v9

    invoke-virtual {v5, v9}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 749
    invoke-virtual {v5}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-interface {p0, v9}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 751
    .local v2, "columIndex":I
    const/4 v9, -0x1

    if-eq v2, v9, :cond_0

    .line 753
    :try_start_0
    invoke-virtual {v5, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    .line 754
    .local v7, "value":Ljava/lang/Object;
    if-nez v7, :cond_0

    .line 755
    invoke-interface {p0, v2}, Landroid/database/Cursor;->isNull(I)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 756
    const/4 v9, 0x0

    invoke-virtual {v5, p1, v9}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 777
    .end local v7    # "value":Ljava/lang/Object;
    :catch_0
    move-exception v4

    .line 778
    .local v4, "e":Ljava/lang/Exception;
    invoke-static {p1}, Lcom/blank/bm15/dao/BlankDao;->getTableName(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 757
    .end local v4    # "e":Ljava/lang/Exception;
    .restart local v7    # "value":Ljava/lang/Object;
    :cond_2
    :try_start_1
    invoke-virtual {v5}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v9

    const-class v10, Ljava/lang/Boolean;

    invoke-virtual {v9, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 758
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-static {v9}, Lcom/blank/bm15/dao/utils/BlankObj;->toBoolean(Ljava/lang/Object;)Ljava/lang/Boolean;

    move-result-object v9

    invoke-virtual {v5, p1, v9}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0

    .line 759
    :cond_3
    invoke-virtual {v5}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v9

    const-class v10, Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 760
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v5, p1, v9}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0

    .line 761
    :cond_4
    invoke-virtual {v5}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v9

    const-class v10, Ljava/lang/Integer;

    invoke-virtual {v9, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_5

    .line 762
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v5, p1, v9}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 763
    :cond_5
    invoke-virtual {v5}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v9

    const-class v10, Ljava/lang/Long;

    invoke-virtual {v9, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_6

    .line 764
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    invoke-static {v9}, Lcom/blank/bm15/dao/utils/BlankObj;->toLong(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object v9

    invoke-virtual {v5, p1, v9}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 765
    :cond_6
    invoke-virtual {v5}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v9

    const-class v10, Ljava/lang/Float;

    invoke-virtual {v9, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_7

    .line 766
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getFloat(I)F

    move-result v9

    invoke-static {v9}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v9

    invoke-static {v9}, Lcom/blank/bm15/dao/utils/BlankObj;->toFloat(Ljava/lang/Object;)Ljava/lang/Float;

    move-result-object v9

    invoke-virtual {v5, p1, v9}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 767
    :cond_7
    invoke-virtual {v5}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v9

    const-class v10, Ljava/lang/Double;

    invoke-virtual {v9, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_8

    .line 768
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v9

    invoke-static {v9}, Lcom/blank/bm15/dao/utils/BlankObj;->toDouble(Ljava/lang/Object;)Ljava/lang/Double;

    move-result-object v9

    invoke-virtual {v5, p1, v9}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 769
    :cond_8
    const-class v9, Lcom/blank/bm15/dao/utils/BlankBase;

    invoke-virtual {v5}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 770
    invoke-virtual {v5}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v1

    .line 771
    .local v1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Class;

    const/4 v10, 0x0

    const-class v11, Landroid/content/Context;

    aput-object v11, v9, v10

    invoke-virtual {v1, v9}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v3

    .line 772
    .local v3, "con":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<+Lcom/blank/bm15/dao/utils/BlankBase;>;"
    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    invoke-virtual {p1}, Lcom/blank/bm15/dao/utils/BlankBase;->getContext()Landroid/content/Context;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-virtual {v3, v9}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/dao/utils/BlankBase;

    .line 773
    .local v0, "aux":Lcom/blank/bm15/dao/utils/BlankBase;
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v0, v9}, Lcom/blank/bm15/dao/utils/BlankBase;->setId(Ljava/lang/Integer;)V

    .line 774
    invoke-virtual {v5, p1, v0}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0

    .line 784
    .end local v0    # "aux":Lcom/blank/bm15/dao/utils/BlankBase;
    .end local v1    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "columIndex":I
    .end local v3    # "con":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<+Lcom/blank/bm15/dao/utils/BlankBase;>;"
    .end local v5    # "field":Ljava/lang/reflect/Field;
    .end local v7    # "value":Ljava/lang/Object;
    :cond_9
    invoke-virtual {p1, v9}, Lcom/blank/bm15/dao/utils/BlankBase;->setId(Ljava/lang/Integer;)V

    goto/16 :goto_1
.end method

.method protected static resetObject(Lcom/blank/bm15/dao/utils/BlankBase;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/blank/bm15/dao/utils/BlankBase;",
            ">(TT;)V"
        }
    .end annotation

    .prologue
    .line 675
    .local p0, "obj":Lcom/blank/bm15/dao/utils/BlankBase;, "TT;"
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDao;->getOrderedFields(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v2

    .line 676
    .local v2, "fields":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Field;>;"
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    .line 677
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_1

    .line 686
    :cond_0
    return-void

    .line 677
    :cond_1
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/reflect/Field;

    .line 678
    .local v1, "field":Ljava/lang/reflect/Field;
    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    invoke-virtual {v1, v4}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 680
    const/4 v4, 0x0

    :try_start_0
    invoke-virtual {v1, p0, v4}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 681
    :catch_0
    move-exception v0

    .line 682
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDao;->getTableName(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public static saveOrUpdate(Lcom/blank/bm15/dao/utils/BlankBase;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/blank/bm15/dao/utils/BlankBase;",
            ">(TT;)V"
        }
    .end annotation

    .prologue
    .line 271
    .local p0, "obj":Lcom/blank/bm15/dao/utils/BlankBase;, "TT;"
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDao;->openDatabase(Lcom/blank/bm15/dao/utils/BlankBase;)Lcom/blank/bm15/dao/BlankDatabaseManagement;

    move-result-object v0

    .line 273
    .local v0, "database":Lcom/blank/bm15/dao/BlankDatabaseManagement;
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDao;->getContentValues(Lcom/blank/bm15/dao/utils/BlankBase;)Landroid/content/ContentValues;

    move-result-object v3

    .line 274
    .local v3, "values":Landroid/content/ContentValues;
    if-eqz v3, :cond_0

    .line 277
    :try_start_0
    const-string v4, "id"

    invoke-virtual {v3, v4}, Landroid/content/ContentValues;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-static {v4}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/blank/bm15/dao/utils/BlankObj;->isNullOrEmpty(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 278
    invoke-virtual {v0}, Lcom/blank/bm15/dao/BlankDatabaseManagement;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v4

    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDao;->getTableName(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6, v3}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    .line 279
    .local v2, "newId":Ljava/lang/Long;
    invoke-static {v2}, Lcom/blank/bm15/dao/utils/BlankObj;->toInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/blank/bm15/dao/utils/BlankBase;->setId(Ljava/lang/Integer;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 287
    .end local v2    # "newId":Ljava/lang/Long;
    :goto_0
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    .line 290
    :cond_0
    :goto_1
    return-void

    .line 281
    :cond_1
    :try_start_1
    const-string v4, "id"

    invoke-virtual {v3, v4}, Landroid/content/ContentValues;->remove(Ljava/lang/String;)V

    .line 282
    invoke-virtual {v0}, Lcom/blank/bm15/dao/BlankDatabaseManagement;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v4

    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDao;->getTableName(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "id = "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/blank/bm15/dao/utils/BlankBase;->getId()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v4, v5, v3, v6, v7}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 284
    :catch_0
    move-exception v1

    .line 285
    .local v1, "e":Ljava/lang/Exception;
    :try_start_2
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDao;->getTableName(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 287
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    goto :goto_1

    .line 286
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v4

    .line 287
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    .line 288
    throw v4
.end method

.method public static saveOrUpdateAll(Landroid/database/sqlite/SQLiteDatabase;Ljava/util/List;)V
    .locals 9
    .param p0, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/blank/bm15/dao/utils/BlankBase;",
            ">(",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Ljava/util/List",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<TT;>;"
    const/4 v6, 0x0

    .line 299
    if-eqz p1, :cond_1

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_1

    .line 300
    invoke-interface {p1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/blank/bm15/dao/utils/BlankBase;

    invoke-static {v5}, Lcom/blank/bm15/dao/BlankDao;->getTableName(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;

    move-result-object v3

    .line 303
    .local v3, "tableName":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 304
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_0
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_2

    .line 319
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 323
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 326
    .end local v3    # "tableName":Ljava/lang/String;
    :cond_1
    :goto_1
    return-void

    .line 304
    .restart local v3    # "tableName":Ljava/lang/String;
    :cond_2
    :try_start_1
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/blank/bm15/dao/utils/BlankBase;

    .line 306
    .local v2, "obj":Lcom/blank/bm15/dao/utils/BlankBase;, "TT;"
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->getContentValues(Lcom/blank/bm15/dao/utils/BlankBase;)Landroid/content/ContentValues;

    move-result-object v4

    .line 307
    .local v4, "values":Landroid/content/ContentValues;
    if-eqz v4, :cond_0

    .line 309
    const-string v6, "id"

    invoke-virtual {v4, v6}, Landroid/content/ContentValues;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v6}, Lcom/blank/bm15/dao/utils/BlankObj;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/blank/bm15/dao/utils/BlankObj;->isNullOrEmpty(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 310
    const/4 v6, 0x0

    invoke-virtual {p0, v3, v6, v4}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    .line 311
    .local v1, "newId":Ljava/lang/Long;
    invoke-static {v1}, Lcom/blank/bm15/dao/utils/BlankObj;->toInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v2, v6}, Lcom/blank/bm15/dao/utils/BlankBase;->setId(Ljava/lang/Integer;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 320
    .end local v1    # "newId":Ljava/lang/Long;
    .end local v2    # "obj":Lcom/blank/bm15/dao/utils/BlankBase;, "TT;"
    .end local v4    # "values":Landroid/content/ContentValues;
    :catch_0
    move-exception v0

    .line 321
    .local v0, "e":Ljava/lang/Exception;
    const/4 v5, 0x0

    :try_start_2
    invoke-interface {p1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/blank/bm15/dao/utils/BlankBase;

    invoke-static {v5}, Lcom/blank/bm15/dao/BlankDao;->getTableName(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 323
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto :goto_1

    .line 313
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v2    # "obj":Lcom/blank/bm15/dao/utils/BlankBase;, "TT;"
    .restart local v4    # "values":Landroid/content/ContentValues;
    :cond_3
    :try_start_3
    const-string v6, "id"

    invoke-virtual {v4, v6}, Landroid/content/ContentValues;->remove(Ljava/lang/String;)V

    .line 314
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->getTableName(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "id = "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Lcom/blank/bm15/dao/utils/BlankBase;->getId()Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x0

    invoke-virtual {p0, v6, v4, v7, v8}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 322
    .end local v2    # "obj":Lcom/blank/bm15/dao/utils/BlankBase;, "TT;"
    .end local v4    # "values":Landroid/content/ContentValues;
    :catchall_0
    move-exception v5

    .line 323
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 324
    throw v5
.end method

.method public static saveOrUpdateAll(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/blank/bm15/dao/utils/BlankBase;",
            ">(",
            "Ljava/util/List",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .local p0, "list":Ljava/util/List;, "Ljava/util/List<TT;>;"
    const/4 v3, 0x0

    .line 334
    if-eqz p0, :cond_0

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 335
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/blank/bm15/dao/utils/BlankBase;

    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->openDatabase(Lcom/blank/bm15/dao/utils/BlankBase;)Lcom/blank/bm15/dao/BlankDatabaseManagement;

    move-result-object v0

    .line 338
    .local v0, "database":Lcom/blank/bm15/dao/BlankDatabaseManagement;
    :try_start_0
    invoke-virtual {v0}, Lcom/blank/bm15/dao/BlankDatabaseManagement;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    invoke-static {v2, p0}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdateAll(Landroid/database/sqlite/SQLiteDatabase;Ljava/util/List;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 342
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    .line 345
    .end local v0    # "database":Lcom/blank/bm15/dao/BlankDatabaseManagement;
    :cond_0
    :goto_0
    return-void

    .line 339
    .restart local v0    # "database":Lcom/blank/bm15/dao/BlankDatabaseManagement;
    :catch_0
    move-exception v1

    .line 340
    .local v1, "e":Ljava/lang/Exception;
    const/4 v2, 0x0

    :try_start_1
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/blank/bm15/dao/utils/BlankBase;

    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->getTableName(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 342
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    goto :goto_0

    .line 341
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v2

    .line 342
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    .line 343
    throw v2
.end method
