.class public Lcom/blank/bm15/dao/BlankDaoExtra;
.super Lcom/blank/bm15/dao/BlankDao;
.source "BlankDaoExtra.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Lcom/blank/bm15/dao/BlankDao;-><init>()V

    return-void
.end method

.method public static getAllStatistics(Lcom/blank/bm15/model/object/crud/MatchResult;)Ljava/util/List;
    .locals 8
    .param p0, "obj"    # Lcom/blank/bm15/model/object/crud/MatchResult;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/blank/bm15/model/object/crud/MatchResult;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/MatchResult;",
            ">;"
        }
    .end annotation

    .prologue
    .line 97
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 99
    .local v4, "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/MatchResult;>;"
    instance-of v6, p0, Lcom/blank/bm15/model/object/crud/MatchResult;

    if-eqz v6, :cond_3

    .line 100
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDaoExtra;->openDatabase(Lcom/blank/bm15/dao/utils/BlankBase;)Lcom/blank/bm15/dao/BlankDatabaseManagement;

    move-result-object v2

    .line 101
    .local v2, "database":Lcom/blank/bm15/dao/BlankDatabaseManagement;
    const/4 v1, 0x0

    .line 105
    .local v1, "c":Landroid/database/Cursor;
    :try_start_0
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDaoExtra;->getQueryAllStatistics(Lcom/blank/bm15/model/object/crud/MatchResult;)Ljava/lang/String;

    move-result-object v5

    .line 106
    .local v5, "query":Ljava/lang/String;
    invoke-virtual {v2}, Lcom/blank/bm15/dao/BlankDatabaseManagement;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v6, v5, v7}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 107
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 109
    :cond_0
    new-instance v0, Lcom/blank/bm15/model/object/crud/MatchResult;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-direct {v0, v6}, Lcom/blank/bm15/model/object/crud/MatchResult;-><init>(Landroid/content/Context;)V

    .line 110
    .local v0, "aux":Lcom/blank/bm15/model/object/crud/MatchResult;
    invoke-static {v1, v0}, Lcom/blank/bm15/dao/BlankDaoExtra;->putCursorValuesInObject(Landroid/database/Cursor;Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 111
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getMatchday()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v0, v6}, Lcom/blank/bm15/model/object/crud/MatchResult;->setMatches(Ljava/lang/Integer;)V

    .line 112
    invoke-virtual {v0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/blank/bm15/model/util/Util;->getPlayerShortName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Lcom/blank/bm15/model/object/crud/MatchResult;->setName(Ljava/lang/String;)V

    .line 113
    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 114
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v6

    if-nez v6, :cond_0

    .line 119
    .end local v0    # "aux":Lcom/blank/bm15/model/object/crud/MatchResult;
    :cond_1
    if-eqz v1, :cond_2

    .line 120
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 122
    :cond_2
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDaoExtra;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    .line 126
    .end local v1    # "c":Landroid/database/Cursor;
    .end local v2    # "database":Lcom/blank/bm15/dao/BlankDatabaseManagement;
    .end local v5    # "query":Ljava/lang/String;
    :cond_3
    :goto_0
    return-object v4

    .line 116
    .restart local v1    # "c":Landroid/database/Cursor;
    .restart local v2    # "database":Lcom/blank/bm15/dao/BlankDatabaseManagement;
    :catch_0
    move-exception v3

    .line 117
    .local v3, "e":Ljava/lang/Exception;
    :try_start_1
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDaoExtra;->getTableName(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 119
    if-eqz v1, :cond_4

    .line 120
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 122
    :cond_4
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDaoExtra;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    goto :goto_0

    .line 118
    .end local v3    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v6

    .line 119
    if-eqz v1, :cond_5

    .line 120
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 122
    :cond_5
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDaoExtra;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    .line 123
    throw v6
.end method

.method public static getClassification(Lcom/blank/bm15/model/object/other/Classification;)Ljava/util/List;
    .locals 10
    .param p0, "obj"    # Lcom/blank/bm15/model/object/other/Classification;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/blank/bm15/model/object/other/Classification;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/other/Classification;",
            ">;"
        }
    .end annotation

    .prologue
    .line 327
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 329
    .local v6, "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/Classification;>;"
    instance-of v8, p0, Lcom/blank/bm15/model/object/other/Classification;

    if-eqz v8, :cond_2

    .line 330
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDaoExtra;->openDatabase(Lcom/blank/bm15/dao/utils/BlankBase;)Lcom/blank/bm15/dao/BlankDatabaseManagement;

    move-result-object v2

    .line 331
    .local v2, "database":Lcom/blank/bm15/dao/BlankDatabaseManagement;
    const/4 v1, 0x0

    .line 335
    .local v1, "c":Landroid/database/Cursor;
    :try_start_0
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDaoExtra;->getQueryClassification(Lcom/blank/bm15/model/object/other/Classification;)Ljava/lang/String;

    move-result-object v7

    .line 336
    .local v7, "query":Ljava/lang/String;
    invoke-virtual {v2}, Lcom/blank/bm15/dao/BlankDatabaseManagement;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v8

    const/4 v9, 0x0

    invoke-virtual {v8, v7, v9}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 337
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v8

    if-eqz v8, :cond_0

    .line 338
    const/4 v4, 0x1

    .local v4, "i":I
    move v5, v4

    .line 340
    .end local v4    # "i":I
    .local v5, "i":I
    :goto_0
    new-instance v0, Lcom/blank/bm15/model/object/other/Classification;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/other/Classification;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-direct {v0, v8}, Lcom/blank/bm15/model/object/other/Classification;-><init>(Landroid/content/Context;)V

    .line 341
    .local v0, "aux":Lcom/blank/bm15/model/object/other/Classification;
    invoke-static {v1, v0}, Lcom/blank/bm15/dao/BlankDaoExtra;->putCursorValuesInObject(Landroid/database/Cursor;Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 342
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/other/Classification;->getDivision()Ljava/lang/Integer;

    move-result-object v8

    if-eqz v8, :cond_3

    .line 343
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "i":I
    .restart local v4    # "i":I
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v0, v8}, Lcom/blank/bm15/model/object/other/Classification;->setPositionInDivision(Ljava/lang/Integer;)V

    .line 347
    :goto_1
    invoke-interface {v6, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 348
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v8

    if-nez v8, :cond_6

    .line 353
    .end local v0    # "aux":Lcom/blank/bm15/model/object/other/Classification;
    .end local v4    # "i":I
    :cond_0
    if-eqz v1, :cond_1

    .line 354
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 356
    :cond_1
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDaoExtra;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    .line 360
    .end local v1    # "c":Landroid/database/Cursor;
    .end local v2    # "database":Lcom/blank/bm15/dao/BlankDatabaseManagement;
    .end local v7    # "query":Ljava/lang/String;
    :cond_2
    :goto_2
    return-object v6

    .line 344
    .restart local v0    # "aux":Lcom/blank/bm15/model/object/other/Classification;
    .restart local v1    # "c":Landroid/database/Cursor;
    .restart local v2    # "database":Lcom/blank/bm15/dao/BlankDatabaseManagement;
    .restart local v5    # "i":I
    .restart local v7    # "query":Ljava/lang/String;
    :cond_3
    :try_start_1
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/other/Classification;->getConference()Ljava/lang/Integer;

    move-result-object v8

    if-eqz v8, :cond_7

    .line 345
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "i":I
    .restart local v4    # "i":I
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v0, v8}, Lcom/blank/bm15/model/object/other/Classification;->setPositionInConference(Ljava/lang/Integer;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 350
    .end local v0    # "aux":Lcom/blank/bm15/model/object/other/Classification;
    .end local v4    # "i":I
    .end local v7    # "query":Ljava/lang/String;
    :catch_0
    move-exception v3

    .line 351
    .local v3, "e":Ljava/lang/Exception;
    :try_start_2
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDaoExtra;->getTableName(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 353
    if-eqz v1, :cond_4

    .line 354
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 356
    :cond_4
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDaoExtra;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    goto :goto_2

    .line 352
    .end local v3    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v8

    .line 353
    if-eqz v1, :cond_5

    .line 354
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 356
    :cond_5
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDaoExtra;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    .line 357
    throw v8

    .restart local v0    # "aux":Lcom/blank/bm15/model/object/other/Classification;
    .restart local v4    # "i":I
    .restart local v7    # "query":Ljava/lang/String;
    :cond_6
    move v5, v4

    .end local v4    # "i":I
    .restart local v5    # "i":I
    goto :goto_0

    :cond_7
    move v4, v5

    .end local v5    # "i":I
    .restart local v4    # "i":I
    goto :goto_1
.end method

.method public static getDevelopPlayer(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;
    .locals 10
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
    .line 64
    .local p0, "obj":Lcom/blank/bm15/dao/utils/BlankBase;, "TT;"
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 66
    .local v6, "list":Ljava/util/List;, "Ljava/util/List<TT;>;"
    instance-of v8, p0, Lcom/blank/bm15/model/object/crud/MatchResult;

    if-eqz v8, :cond_3

    move-object v7, p0

    .line 67
    check-cast v7, Lcom/blank/bm15/model/object/crud/MatchResult;

    .line 68
    .local v7, "object":Lcom/blank/bm15/model/object/crud/MatchResult;
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDaoExtra;->openDatabase(Lcom/blank/bm15/dao/utils/BlankBase;)Lcom/blank/bm15/dao/BlankDatabaseManagement;

    move-result-object v2

    .line 69
    .local v2, "database":Lcom/blank/bm15/dao/BlankDatabaseManagement;
    const/4 v1, 0x0

    .line 73
    .local v1, "c":Landroid/database/Cursor;
    :try_start_0
    invoke-virtual {v2}, Lcom/blank/bm15/dao/BlankDatabaseManagement;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    .line 74
    .local v3, "db":Landroid/database/sqlite/SQLiteDatabase;
    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/MatchResult;->getMatchday()Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    add-int/lit8 v5, v8, -0xa

    .line 75
    .local v5, "iniMatchday":I
    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "SELECT * FROM "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDao;->getTableName(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " WHERE matchday > "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " AND game = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/MatchResult;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v9

    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Game;->getId()Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    invoke-virtual {v3, v8, v9}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 76
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 78
    :cond_0
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDaoExtra;->createNewInstance(Lcom/blank/bm15/dao/utils/BlankBase;)Lcom/blank/bm15/dao/utils/BlankBase;

    move-result-object v0

    .line 79
    .local v0, "aux":Lcom/blank/bm15/dao/utils/BlankBase;, "TT;"
    invoke-static {v1, v0}, Lcom/blank/bm15/dao/BlankDaoExtra;->putCursorValuesInObject(Landroid/database/Cursor;Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 80
    invoke-interface {v6, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 81
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v8

    if-nez v8, :cond_0

    .line 86
    .end local v0    # "aux":Lcom/blank/bm15/dao/utils/BlankBase;, "TT;"
    :cond_1
    if-eqz v1, :cond_2

    .line 87
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 89
    :cond_2
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDaoExtra;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    .line 93
    .end local v1    # "c":Landroid/database/Cursor;
    .end local v2    # "database":Lcom/blank/bm15/dao/BlankDatabaseManagement;
    .end local v3    # "db":Landroid/database/sqlite/SQLiteDatabase;
    .end local v5    # "iniMatchday":I
    .end local v7    # "object":Lcom/blank/bm15/model/object/crud/MatchResult;
    :cond_3
    :goto_0
    return-object v6

    .line 83
    .restart local v1    # "c":Landroid/database/Cursor;
    .restart local v2    # "database":Lcom/blank/bm15/dao/BlankDatabaseManagement;
    .restart local v7    # "object":Lcom/blank/bm15/model/object/crud/MatchResult;
    :catch_0
    move-exception v4

    .line 84
    .local v4, "e":Ljava/lang/Exception;
    :try_start_1
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDaoExtra;->getTableName(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 86
    if-eqz v1, :cond_4

    .line 87
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 89
    :cond_4
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDaoExtra;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    goto :goto_0

    .line 85
    .end local v4    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v8

    .line 86
    if-eqz v1, :cond_5

    .line 87
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 89
    :cond_5
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDaoExtra;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    .line 90
    throw v8
.end method

.method public static getDraft(Lcom/blank/bm15/model/object/other/Classification;)Ljava/util/List;
    .locals 8
    .param p0, "obj"    # Lcom/blank/bm15/model/object/other/Classification;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/blank/bm15/model/object/other/Classification;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/other/Classification;",
            ">;"
        }
    .end annotation

    .prologue
    .line 384
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 386
    .local v4, "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/other/Classification;>;"
    instance-of v6, p0, Lcom/blank/bm15/model/object/other/Classification;

    if-eqz v6, :cond_3

    .line 387
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDaoExtra;->openDatabase(Lcom/blank/bm15/dao/utils/BlankBase;)Lcom/blank/bm15/dao/BlankDatabaseManagement;

    move-result-object v2

    .line 388
    .local v2, "database":Lcom/blank/bm15/dao/BlankDatabaseManagement;
    const/4 v1, 0x0

    .line 392
    .local v1, "c":Landroid/database/Cursor;
    :try_start_0
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDaoExtra;->getQueryDraft(Lcom/blank/bm15/model/object/other/Classification;)Ljava/lang/String;

    move-result-object v5

    .line 393
    .local v5, "query":Ljava/lang/String;
    invoke-virtual {v2}, Lcom/blank/bm15/dao/BlankDatabaseManagement;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v6, v5, v7}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 394
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 396
    :cond_0
    new-instance v0, Lcom/blank/bm15/model/object/other/Classification;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/other/Classification;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-direct {v0, v6}, Lcom/blank/bm15/model/object/other/Classification;-><init>(Landroid/content/Context;)V

    .line 397
    .local v0, "aux":Lcom/blank/bm15/model/object/other/Classification;
    invoke-static {v1, v0}, Lcom/blank/bm15/dao/BlankDaoExtra;->putCursorValuesInObject(Landroid/database/Cursor;Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 398
    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 399
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v6

    if-nez v6, :cond_0

    .line 404
    .end local v0    # "aux":Lcom/blank/bm15/model/object/other/Classification;
    :cond_1
    if-eqz v1, :cond_2

    .line 405
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 407
    :cond_2
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDaoExtra;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    .line 411
    .end local v1    # "c":Landroid/database/Cursor;
    .end local v2    # "database":Lcom/blank/bm15/dao/BlankDatabaseManagement;
    .end local v5    # "query":Ljava/lang/String;
    :cond_3
    :goto_0
    return-object v4

    .line 401
    .restart local v1    # "c":Landroid/database/Cursor;
    .restart local v2    # "database":Lcom/blank/bm15/dao/BlankDatabaseManagement;
    :catch_0
    move-exception v3

    .line 402
    .local v3, "e":Ljava/lang/Exception;
    :try_start_1
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDaoExtra;->getTableName(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 404
    if-eqz v1, :cond_4

    .line 405
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 407
    :cond_4
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDaoExtra;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    goto :goto_0

    .line 403
    .end local v3    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v6

    .line 404
    if-eqz v1, :cond_5

    .line 405
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 407
    :cond_5
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDaoExtra;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    .line 408
    throw v6
.end method

.method public static getDraftPlayers(Lcom/blank/bm15/model/object/crud/Player;)Ljava/util/List;
    .locals 8
    .param p0, "obj"    # Lcom/blank/bm15/model/object/crud/Player;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/blank/bm15/model/object/crud/Player;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/Player;",
            ">;"
        }
    .end annotation

    .prologue
    .line 207
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 209
    .local v4, "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    instance-of v6, p0, Lcom/blank/bm15/model/object/crud/Player;

    if-eqz v6, :cond_3

    .line 210
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDaoExtra;->openDatabase(Lcom/blank/bm15/dao/utils/BlankBase;)Lcom/blank/bm15/dao/BlankDatabaseManagement;

    move-result-object v2

    .line 211
    .local v2, "database":Lcom/blank/bm15/dao/BlankDatabaseManagement;
    const/4 v1, 0x0

    .line 215
    .local v1, "c":Landroid/database/Cursor;
    :try_start_0
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDaoExtra;->getQueryDraftPlayers(Lcom/blank/bm15/model/object/crud/Player;)Ljava/lang/String;

    move-result-object v5

    .line 216
    .local v5, "query":Ljava/lang/String;
    invoke-virtual {v2}, Lcom/blank/bm15/dao/BlankDatabaseManagement;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v6, v5, v7}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 217
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 219
    :cond_0
    new-instance v0, Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-direct {v0, v6}, Lcom/blank/bm15/model/object/crud/Player;-><init>(Landroid/content/Context;)V

    .line 220
    .local v0, "aux":Lcom/blank/bm15/model/object/crud/Player;
    invoke-static {v1, v0}, Lcom/blank/bm15/dao/BlankDaoExtra;->putCursorValuesInObject(Landroid/database/Cursor;Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 221
    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 222
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v6

    if-nez v6, :cond_0

    .line 227
    .end local v0    # "aux":Lcom/blank/bm15/model/object/crud/Player;
    :cond_1
    if-eqz v1, :cond_2

    .line 228
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 230
    :cond_2
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDaoExtra;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    .line 234
    .end local v1    # "c":Landroid/database/Cursor;
    .end local v2    # "database":Lcom/blank/bm15/dao/BlankDatabaseManagement;
    .end local v5    # "query":Ljava/lang/String;
    :cond_3
    :goto_0
    return-object v4

    .line 224
    .restart local v1    # "c":Landroid/database/Cursor;
    .restart local v2    # "database":Lcom/blank/bm15/dao/BlankDatabaseManagement;
    :catch_0
    move-exception v3

    .line 225
    .local v3, "e":Ljava/lang/Exception;
    :try_start_1
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDaoExtra;->getTableName(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 227
    if-eqz v1, :cond_4

    .line 228
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 230
    :cond_4
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDaoExtra;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    goto :goto_0

    .line 226
    .end local v3    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v6

    .line 227
    if-eqz v1, :cond_5

    .line 228
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 230
    :cond_5
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDaoExtra;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    .line 231
    throw v6
.end method

.method public static getFreeAgents(Lcom/blank/bm15/model/object/crud/Player;)Ljava/util/List;
    .locals 8
    .param p0, "obj"    # Lcom/blank/bm15/model/object/crud/Player;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/blank/bm15/model/object/crud/Player;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/Player;",
            ">;"
        }
    .end annotation

    .prologue
    .line 165
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 167
    .local v4, "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Player;>;"
    instance-of v6, p0, Lcom/blank/bm15/model/object/crud/Player;

    if-eqz v6, :cond_3

    .line 168
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDaoExtra;->openDatabase(Lcom/blank/bm15/dao/utils/BlankBase;)Lcom/blank/bm15/dao/BlankDatabaseManagement;

    move-result-object v2

    .line 169
    .local v2, "database":Lcom/blank/bm15/dao/BlankDatabaseManagement;
    const/4 v1, 0x0

    .line 173
    .local v1, "c":Landroid/database/Cursor;
    :try_start_0
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDaoExtra;->getQueryFreeAgents(Lcom/blank/bm15/model/object/crud/Player;)Ljava/lang/String;

    move-result-object v5

    .line 174
    .local v5, "query":Ljava/lang/String;
    invoke-virtual {v2}, Lcom/blank/bm15/dao/BlankDatabaseManagement;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v6, v5, v7}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 175
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 177
    :cond_0
    new-instance v0, Lcom/blank/bm15/model/object/crud/Player;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-direct {v0, v6}, Lcom/blank/bm15/model/object/crud/Player;-><init>(Landroid/content/Context;)V

    .line 178
    .local v0, "aux":Lcom/blank/bm15/model/object/crud/Player;
    invoke-static {v1, v0}, Lcom/blank/bm15/dao/BlankDaoExtra;->putCursorValuesInObject(Landroid/database/Cursor;Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 179
    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 180
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v6

    if-nez v6, :cond_0

    .line 185
    .end local v0    # "aux":Lcom/blank/bm15/model/object/crud/Player;
    :cond_1
    if-eqz v1, :cond_2

    .line 186
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 188
    :cond_2
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDaoExtra;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    .line 192
    .end local v1    # "c":Landroid/database/Cursor;
    .end local v2    # "database":Lcom/blank/bm15/dao/BlankDatabaseManagement;
    .end local v5    # "query":Ljava/lang/String;
    :cond_3
    :goto_0
    return-object v4

    .line 182
    .restart local v1    # "c":Landroid/database/Cursor;
    .restart local v2    # "database":Lcom/blank/bm15/dao/BlankDatabaseManagement;
    :catch_0
    move-exception v3

    .line 183
    .local v3, "e":Ljava/lang/Exception;
    :try_start_1
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDaoExtra;->getTableName(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 185
    if-eqz v1, :cond_4

    .line 186
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 188
    :cond_4
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDaoExtra;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    goto :goto_0

    .line 184
    .end local v3    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v6

    .line 185
    if-eqz v1, :cond_5

    .line 186
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 188
    :cond_5
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDaoExtra;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    .line 189
    throw v6
.end method

.method public static getMatchesToDeleteByPlayoffs(Lcom/blank/bm15/model/object/crud/Playoffs;)Ljava/util/List;
    .locals 8
    .param p0, "obj"    # Lcom/blank/bm15/model/object/crud/Playoffs;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/blank/bm15/model/object/crud/Playoffs;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/Match;",
            ">;"
        }
    .end annotation

    .prologue
    .line 427
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 429
    .local v4, "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Match;>;"
    instance-of v6, p0, Lcom/blank/bm15/model/object/crud/Playoffs;

    if-eqz v6, :cond_3

    .line 430
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDaoExtra;->openDatabase(Lcom/blank/bm15/dao/utils/BlankBase;)Lcom/blank/bm15/dao/BlankDatabaseManagement;

    move-result-object v2

    .line 431
    .local v2, "database":Lcom/blank/bm15/dao/BlankDatabaseManagement;
    const/4 v1, 0x0

    .line 435
    .local v1, "c":Landroid/database/Cursor;
    :try_start_0
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDaoExtra;->getQueryMatchesToDeleteByPlayoffs(Lcom/blank/bm15/model/object/crud/Playoffs;)Ljava/lang/String;

    move-result-object v5

    .line 436
    .local v5, "query":Ljava/lang/String;
    invoke-virtual {v2}, Lcom/blank/bm15/dao/BlankDatabaseManagement;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v6, v5, v7}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 437
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 439
    :cond_0
    new-instance v0, Lcom/blank/bm15/model/object/crud/Match;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Playoffs;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-direct {v0, v6}, Lcom/blank/bm15/model/object/crud/Match;-><init>(Landroid/content/Context;)V

    .line 440
    .local v0, "aux":Lcom/blank/bm15/model/object/crud/Match;
    invoke-static {v1, v0}, Lcom/blank/bm15/dao/BlankDaoExtra;->putCursorValuesInObject(Landroid/database/Cursor;Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 441
    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 442
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v6

    if-nez v6, :cond_0

    .line 447
    .end local v0    # "aux":Lcom/blank/bm15/model/object/crud/Match;
    :cond_1
    if-eqz v1, :cond_2

    .line 448
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 450
    :cond_2
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDaoExtra;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    .line 454
    .end local v1    # "c":Landroid/database/Cursor;
    .end local v2    # "database":Lcom/blank/bm15/dao/BlankDatabaseManagement;
    .end local v5    # "query":Ljava/lang/String;
    :cond_3
    :goto_0
    return-object v4

    .line 444
    .restart local v1    # "c":Landroid/database/Cursor;
    .restart local v2    # "database":Lcom/blank/bm15/dao/BlankDatabaseManagement;
    :catch_0
    move-exception v3

    .line 445
    .local v3, "e":Ljava/lang/Exception;
    :try_start_1
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDaoExtra;->getTableName(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 447
    if-eqz v1, :cond_4

    .line 448
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 450
    :cond_4
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDaoExtra;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    goto :goto_0

    .line 446
    .end local v3    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v6

    .line 447
    if-eqz v1, :cond_5

    .line 448
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 450
    :cond_5
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDaoExtra;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    .line 451
    throw v6
.end method

.method public static getNews(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;
    .locals 10
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
    .line 29
    .local p0, "obj":Lcom/blank/bm15/dao/utils/BlankBase;, "TT;"
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 31
    .local v6, "list":Ljava/util/List;, "Ljava/util/List<TT;>;"
    instance-of v8, p0, Lcom/blank/bm15/model/object/crud/News;

    if-eqz v8, :cond_3

    move-object v7, p0

    .line 32
    check-cast v7, Lcom/blank/bm15/model/object/crud/News;

    .line 33
    .local v7, "news":Lcom/blank/bm15/model/object/crud/News;
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDaoExtra;->openDatabase(Lcom/blank/bm15/dao/utils/BlankBase;)Lcom/blank/bm15/dao/BlankDatabaseManagement;

    move-result-object v2

    .line 34
    .local v2, "database":Lcom/blank/bm15/dao/BlankDatabaseManagement;
    const/4 v1, 0x0

    .line 38
    .local v1, "c":Landroid/database/Cursor;
    :try_start_0
    invoke-virtual {v2}, Lcom/blank/bm15/dao/BlankDatabaseManagement;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    .line 39
    .local v3, "db":Landroid/database/sqlite/SQLiteDatabase;
    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/News;->getMatchday()Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    add-int/lit8 v5, v8, -0x1e

    .line 40
    .local v5, "iniMatchday":I
    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "SELECT * FROM "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDao;->getTableName(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " WHERE matchday < "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/News;->getMatchday()Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 41
    const-string v9, " AND matchday > "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 42
    const-string v9, " AND game = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v7}, Lcom/blank/bm15/model/object/crud/News;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v9

    invoke-virtual {v9}, Lcom/blank/bm15/model/object/crud/Game;->getId()Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    .line 40
    invoke-virtual {v3, v8, v9}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 43
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 45
    :cond_0
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDaoExtra;->createNewInstance(Lcom/blank/bm15/dao/utils/BlankBase;)Lcom/blank/bm15/dao/utils/BlankBase;

    move-result-object v0

    .line 46
    .local v0, "aux":Lcom/blank/bm15/dao/utils/BlankBase;, "TT;"
    invoke-static {v1, v0}, Lcom/blank/bm15/dao/BlankDaoExtra;->putCursorValuesInObject(Landroid/database/Cursor;Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 47
    invoke-interface {v6, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 48
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v8

    if-nez v8, :cond_0

    .line 53
    .end local v0    # "aux":Lcom/blank/bm15/dao/utils/BlankBase;, "TT;"
    :cond_1
    if-eqz v1, :cond_2

    .line 54
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 56
    :cond_2
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDaoExtra;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    .line 60
    .end local v1    # "c":Landroid/database/Cursor;
    .end local v2    # "database":Lcom/blank/bm15/dao/BlankDatabaseManagement;
    .end local v3    # "db":Landroid/database/sqlite/SQLiteDatabase;
    .end local v5    # "iniMatchday":I
    .end local v7    # "news":Lcom/blank/bm15/model/object/crud/News;
    :cond_3
    :goto_0
    return-object v6

    .line 50
    .restart local v1    # "c":Landroid/database/Cursor;
    .restart local v2    # "database":Lcom/blank/bm15/dao/BlankDatabaseManagement;
    .restart local v7    # "news":Lcom/blank/bm15/model/object/crud/News;
    :catch_0
    move-exception v4

    .line 51
    .local v4, "e":Ljava/lang/Exception;
    :try_start_1
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDaoExtra;->getTableName(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 53
    if-eqz v1, :cond_4

    .line 54
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 56
    :cond_4
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDaoExtra;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    goto :goto_0

    .line 52
    .end local v4    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v8

    .line 53
    if-eqz v1, :cond_5

    .line 54
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 56
    :cond_5
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDaoExtra;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    .line 57
    throw v8
.end method

.method public static getPlayedMatchesTeam(Lcom/blank/bm15/model/object/crud/Match;)Ljava/util/List;
    .locals 8
    .param p0, "obj"    # Lcom/blank/bm15/model/object/crud/Match;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/blank/bm15/model/object/crud/Match;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/Match;",
            ">;"
        }
    .end annotation

    .prologue
    .line 287
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 289
    .local v4, "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Match;>;"
    instance-of v6, p0, Lcom/blank/bm15/model/object/crud/Match;

    if-eqz v6, :cond_3

    .line 290
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDaoExtra;->openDatabase(Lcom/blank/bm15/dao/utils/BlankBase;)Lcom/blank/bm15/dao/BlankDatabaseManagement;

    move-result-object v2

    .line 291
    .local v2, "database":Lcom/blank/bm15/dao/BlankDatabaseManagement;
    const/4 v1, 0x0

    .line 295
    .local v1, "c":Landroid/database/Cursor;
    :try_start_0
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDaoExtra;->getQueryPlayedMatchesTeam(Lcom/blank/bm15/model/object/crud/Match;)Ljava/lang/String;

    move-result-object v5

    .line 296
    .local v5, "query":Ljava/lang/String;
    invoke-virtual {v2}, Lcom/blank/bm15/dao/BlankDatabaseManagement;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v6, v5, v7}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 297
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 299
    :cond_0
    new-instance v0, Lcom/blank/bm15/model/object/crud/Match;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-direct {v0, v6}, Lcom/blank/bm15/model/object/crud/Match;-><init>(Landroid/content/Context;)V

    .line 300
    .local v0, "aux":Lcom/blank/bm15/model/object/crud/Match;
    invoke-static {v1, v0}, Lcom/blank/bm15/dao/BlankDaoExtra;->putCursorValuesInObject(Landroid/database/Cursor;Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 301
    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 302
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v6

    if-nez v6, :cond_0

    .line 307
    .end local v0    # "aux":Lcom/blank/bm15/model/object/crud/Match;
    :cond_1
    if-eqz v1, :cond_2

    .line 308
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 310
    :cond_2
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDaoExtra;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    .line 314
    .end local v1    # "c":Landroid/database/Cursor;
    .end local v2    # "database":Lcom/blank/bm15/dao/BlankDatabaseManagement;
    .end local v5    # "query":Ljava/lang/String;
    :cond_3
    :goto_0
    return-object v4

    .line 304
    .restart local v1    # "c":Landroid/database/Cursor;
    .restart local v2    # "database":Lcom/blank/bm15/dao/BlankDatabaseManagement;
    :catch_0
    move-exception v3

    .line 305
    .local v3, "e":Ljava/lang/Exception;
    :try_start_1
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDaoExtra;->getTableName(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 307
    if-eqz v1, :cond_4

    .line 308
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 310
    :cond_4
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDaoExtra;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    goto :goto_0

    .line 306
    .end local v3    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v6

    .line 307
    if-eqz v1, :cond_5

    .line 308
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 310
    :cond_5
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDaoExtra;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    .line 311
    throw v6
.end method

.method private static getQueryAllStatistics(Lcom/blank/bm15/model/object/crud/MatchResult;)Ljava/lang/String;
    .locals 4
    .param p0, "obj"    # Lcom/blank/bm15/model/object/crud/MatchResult;

    .prologue
    .line 130
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "SELECT MatchResult.player, Player.name, COUNT(MatchResult.player) as matchday, SUM(MatchResult.minutesPlayed) as minutesPlayed, SUM(MatchResult.blocks) as blocks, SUM(MatchResult.foulsMade) as foulsMade, SUM(MatchResult.passesOk) as passesOk, SUM(MatchResult.passesKo) as passesKo, SUM(MatchResult.rebounds) as rebounds, SUM(MatchResult.steals) as steals, SUM(MatchResult.shotsFreeOk) as shotsFreeOk, SUM(MatchResult.shotsFreeKo) as shotsFreeKo, SUM(MatchResult.shotsInteriorOk) as shotsInteriorOk, SUM(MatchResult.shotsInteriorKo) as shotsInteriorKo, SUM(MatchResult.shotsExteriorDoubleOk) as shotsExteriorDoubleOk, SUM(MatchResult.shotsExteriorDoubleKo) as shotsExteriorDoubleKo, SUM(MatchResult.shotsExteriorTripleOk) as shotsExteriorTripleOk, SUM(MatchResult.shotsExteriorTripleKo) as shotsExteriorTripleKo FROM MatchResult INNER JOIN Player ON MatchResult.player = Player.id WHERE MatchResult.game = "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 149
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Game;->getId()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 130
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 151
    .local v1, "query":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPlayer()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Player;->getYearsExperience()Ljava/lang/Integer;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 152
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, "AND Player.yearsExperience = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPlayer()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Player;->getYearsExperience()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 155
    :cond_0
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPlayer()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 156
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, "AND Player.positionFirst = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/MatchResult;->getPlayer()Lcom/blank/bm15/model/object/crud/Player;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 159
    :cond_1
    const-string v0, "GROUP BY MatchResult.player, Player.name"

    .line 161
    .local v0, "groupBy":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private static getQueryClassification(Lcom/blank/bm15/model/object/other/Classification;)Ljava/lang/String;
    .locals 5
    .param p0, "obj"    # Lcom/blank/bm15/model/object/other/Classification;

    .prologue
    .line 364
    const-string v1, "SELECT league.game AS game, league.team AS team, league.gamesLost AS gamesLost, league.gamesWon AS gamesWon, league.pointsAllowed AS pointsAllowed, league.pointsScored AS pointsScored, team.name AS name, team.conference AS conference, team.division AS division FROM Team team, League league"

    .line 365
    .local v1, "query":Ljava/lang/String;
    const-string v2, " WHERE team.game = league.game AND team.id = league.team"

    .line 366
    .local v2, "where":Ljava/lang/String;
    const-string v0, " ORDER BY league.gamesWon DESC, league.gamesLost ASC, league.pointsScored DESC, league.pointsAllowed ASC"

    .line 368
    .local v0, "orderBy":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/other/Classification;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v3

    if-eqz v3, :cond_0

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/other/Classification;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Game;->getId()Ljava/lang/Integer;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 369
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, " AND team.game = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/other/Classification;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Game;->getId()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 372
    :cond_0
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/other/Classification;->getDivision()Ljava/lang/Integer;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 373
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, " AND team.division = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/other/Classification;->getDivision()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 376
    :cond_1
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/other/Classification;->getConference()Ljava/lang/Integer;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 377
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, " AND team.conference = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/other/Classification;->getConference()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 380
    :cond_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method private static getQueryDraft(Lcom/blank/bm15/model/object/other/Classification;)Ljava/lang/String;
    .locals 5
    .param p0, "obj"    # Lcom/blank/bm15/model/object/other/Classification;

    .prologue
    .line 415
    const-string v1, "SELECT league.game AS game, league.team AS team, league.gamesLost AS gamesLost, league.gamesWon AS gamesWon, league.pointsAllowed AS pointsAllowed, league.pointsScored AS pointsScored, team.name AS name, team.conference AS conference, team.division AS division FROM Team team, League league"

    .line 416
    .local v1, "query":Ljava/lang/String;
    const-string v2, " WHERE team.game = league.game AND team.id = league.team"

    .line 417
    .local v2, "where":Ljava/lang/String;
    const-string v0, " ORDER BY league.gamesWon ASC, league.pointsScored ASC, league.pointsAllowed DESC"

    .line 419
    .local v0, "orderBy":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/other/Classification;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v3

    if-eqz v3, :cond_0

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/other/Classification;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Game;->getId()Ljava/lang/Integer;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 420
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, " AND team.game = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/other/Classification;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Game;->getId()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 423
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method private static getQueryDraftPlayers(Lcom/blank/bm15/model/object/crud/Player;)Ljava/lang/String;
    .locals 4
    .param p0, "obj"    # Lcom/blank/bm15/model/object/crud/Player;

    .prologue
    .line 238
    const-string v0, "SELECT * FROM Player"

    .line 239
    .local v0, "query":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, " WHERE game = "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Game;->getId()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " AND team = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/4 v3, -0x1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 241
    .local v1, "where":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private static getQueryFreeAgents(Lcom/blank/bm15/model/object/crud/Player;)Ljava/lang/String;
    .locals 4
    .param p0, "obj"    # Lcom/blank/bm15/model/object/crud/Player;

    .prologue
    .line 196
    const-string v0, "SELECT * FROM Player"

    .line 197
    .local v0, "query":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, " WHERE game = "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Game;->getId()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " AND team IS NULL"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 199
    .local v1, "where":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 200
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, " AND positionFirst = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Player;->getPositionFirst()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 203
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private static getQueryMatchesToDeleteByPlayoffs(Lcom/blank/bm15/model/object/crud/Playoffs;)Ljava/lang/String;
    .locals 4
    .param p0, "obj"    # Lcom/blank/bm15/model/object/crud/Playoffs;

    .prologue
    .line 458
    const-string v0, "SELECT match.id FROM Match match, Playoffs playoffs"

    .line 459
    .local v0, "query":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, " WHERE (match.teamLocal = playoffs.team OR match.teamVisitor = playoffs.team) AND playoffs.seriesGamesWon = "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 460
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Playoffs;->getSeriesGamesWon()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " AND match.game = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Playoffs;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Game;->getId()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 461
    const-string v3, " AND match.matchday > "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Playoffs;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v3

    invoke-virtual {v3}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 459
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 463
    .local v1, "where":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private static getQueryPlayedMatchesTeam(Lcom/blank/bm15/model/object/crud/Match;)Ljava/lang/String;
    .locals 5
    .param p0, "obj"    # Lcom/blank/bm15/model/object/crud/Match;

    .prologue
    .line 318
    const-string v1, "SELECT * FROM Match"

    .line 319
    .local v1, "query":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, " WHERE game = "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Game;->getId()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " AND matchday < "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Game;->getCurrentMatchday()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 320
    const-string v4, " AND (teamLocal = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " OR teamVisitor = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getTeamLocal()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 319
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 321
    .local v2, "where":Ljava/lang/String;
    const-string v0, " ORDER BY matchday ASC"

    .line 323
    .local v0, "orderBy":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method private static getQueryUserMatchCalendar(Lcom/blank/bm15/model/object/crud/Match;)Ljava/lang/String;
    .locals 5
    .param p0, "obj"    # Lcom/blank/bm15/model/object/crud/Match;

    .prologue
    .line 276
    const-string v1, "SELECT * FROM Match"

    .line 277
    .local v1, "query":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, " WHERE game = "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Game;->getId()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " AND (teamLocal = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " OR teamVisitor = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getGame()Lcom/blank/bm15/model/object/crud/Game;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Game;->getUserTeam()Lcom/blank/bm15/model/object/crud/Team;

    move-result-object v4

    invoke-virtual {v4}, Lcom/blank/bm15/model/object/crud/Team;->getId()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 278
    .local v2, "where":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getMatchday()Ljava/lang/Integer;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 279
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, " AND matchday = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getMatchday()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 281
    :cond_0
    const-string v0, " ORDER BY matchday ASC"

    .line 283
    .local v0, "orderBy":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public static getUserMatchCalendar(Lcom/blank/bm15/model/object/crud/Match;)Ljava/util/List;
    .locals 8
    .param p0, "obj"    # Lcom/blank/bm15/model/object/crud/Match;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/blank/bm15/model/object/crud/Match;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/model/object/crud/Match;",
            ">;"
        }
    .end annotation

    .prologue
    .line 245
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 247
    .local v4, "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/model/object/crud/Match;>;"
    instance-of v6, p0, Lcom/blank/bm15/model/object/crud/Match;

    if-eqz v6, :cond_3

    .line 248
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDaoExtra;->openDatabase(Lcom/blank/bm15/dao/utils/BlankBase;)Lcom/blank/bm15/dao/BlankDatabaseManagement;

    move-result-object v2

    .line 249
    .local v2, "database":Lcom/blank/bm15/dao/BlankDatabaseManagement;
    const/4 v1, 0x0

    .line 253
    .local v1, "c":Landroid/database/Cursor;
    :try_start_0
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDaoExtra;->getQueryUserMatchCalendar(Lcom/blank/bm15/model/object/crud/Match;)Ljava/lang/String;

    move-result-object v5

    .line 254
    .local v5, "query":Ljava/lang/String;
    invoke-virtual {v2}, Lcom/blank/bm15/dao/BlankDatabaseManagement;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v6, v5, v7}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 255
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 257
    :cond_0
    new-instance v0, Lcom/blank/bm15/model/object/crud/Match;

    invoke-virtual {p0}, Lcom/blank/bm15/model/object/crud/Match;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-direct {v0, v6}, Lcom/blank/bm15/model/object/crud/Match;-><init>(Landroid/content/Context;)V

    .line 258
    .local v0, "aux":Lcom/blank/bm15/model/object/crud/Match;
    invoke-static {v1, v0}, Lcom/blank/bm15/dao/BlankDaoExtra;->putCursorValuesInObject(Landroid/database/Cursor;Lcom/blank/bm15/dao/utils/BlankBase;)V

    .line 259
    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 260
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v6

    if-nez v6, :cond_0

    .line 265
    .end local v0    # "aux":Lcom/blank/bm15/model/object/crud/Match;
    :cond_1
    if-eqz v1, :cond_2

    .line 266
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 268
    :cond_2
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDaoExtra;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    .line 272
    .end local v1    # "c":Landroid/database/Cursor;
    .end local v2    # "database":Lcom/blank/bm15/dao/BlankDatabaseManagement;
    .end local v5    # "query":Ljava/lang/String;
    :cond_3
    :goto_0
    return-object v4

    .line 262
    .restart local v1    # "c":Landroid/database/Cursor;
    .restart local v2    # "database":Lcom/blank/bm15/dao/BlankDatabaseManagement;
    :catch_0
    move-exception v3

    .line 263
    .local v3, "e":Ljava/lang/Exception;
    :try_start_1
    invoke-static {p0}, Lcom/blank/bm15/dao/BlankDaoExtra;->getTableName(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 265
    if-eqz v1, :cond_4

    .line 266
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 268
    :cond_4
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDaoExtra;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    goto :goto_0

    .line 264
    .end local v3    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v6

    .line 265
    if-eqz v1, :cond_5

    .line 266
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 268
    :cond_5
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDaoExtra;->closeDatabase(Lcom/blank/bm15/dao/BlankDatabaseManagement;)V

    .line 269
    throw v6
.end method
