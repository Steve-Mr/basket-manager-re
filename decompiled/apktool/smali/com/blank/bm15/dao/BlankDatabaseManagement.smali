.class public Lcom/blank/bm15/dao/BlankDatabaseManagement;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "BlankDatabaseManagement.java"


# static fields
.field public static final DATABASE_VERSION:I = 0x1


# instance fields
.field protected context:Landroid/content/Context;

.field public databaseName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 43
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    iget v1, v1, Landroid/content/pm/ApplicationInfo;->labelRes:I

    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, ".db"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-direct {p0, p1, v0, v1, v2}, Lcom/blank/bm15/dao/BlankDatabaseManagement;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 44
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "factory"    # Landroid/database/sqlite/SQLiteDatabase$CursorFactory;
    .param p4, "version"    # I

    .prologue
    .line 54
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 55
    iput-object p1, p0, Lcom/blank/bm15/dao/BlankDatabaseManagement;->context:Landroid/content/Context;

    .line 56
    iput-object p2, p0, Lcom/blank/bm15/dao/BlankDatabaseManagement;->databaseName:Ljava/lang/String;

    .line 57
    return-void
.end method

.method private getBlankBaseObjects()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/blank/bm15/dao/utils/BlankBase;",
            ">;"
        }
    .end annotation

    .prologue
    .line 99
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 102
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/dao/utils/BlankBase;>;"
    new-instance v1, Lcom/blank/bm15/model/object/crud/Challenge;

    iget-object v2, p0, Lcom/blank/bm15/dao/BlankDatabaseManagement;->context:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/blank/bm15/model/object/crud/Challenge;-><init>(Landroid/content/Context;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 103
    new-instance v1, Lcom/blank/bm15/model/object/crud/Navigation;

    iget-object v2, p0, Lcom/blank/bm15/dao/BlankDatabaseManagement;->context:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/blank/bm15/model/object/crud/Navigation;-><init>(Landroid/content/Context;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 104
    new-instance v1, Lcom/blank/bm15/model/object/crud/Game;

    iget-object v2, p0, Lcom/blank/bm15/dao/BlankDatabaseManagement;->context:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/blank/bm15/model/object/crud/Game;-><init>(Landroid/content/Context;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 105
    new-instance v1, Lcom/blank/bm15/model/object/crud/Team;

    iget-object v2, p0, Lcom/blank/bm15/dao/BlankDatabaseManagement;->context:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/blank/bm15/model/object/crud/Team;-><init>(Landroid/content/Context;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 106
    new-instance v1, Lcom/blank/bm15/model/object/crud/Tactic;

    iget-object v2, p0, Lcom/blank/bm15/dao/BlankDatabaseManagement;->context:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/blank/bm15/model/object/crud/Tactic;-><init>(Landroid/content/Context;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 107
    new-instance v1, Lcom/blank/bm15/model/object/crud/Player;

    iget-object v2, p0, Lcom/blank/bm15/dao/BlankDatabaseManagement;->context:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/blank/bm15/model/object/crud/Player;-><init>(Landroid/content/Context;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 108
    new-instance v1, Lcom/blank/bm15/model/object/crud/League;

    iget-object v2, p0, Lcom/blank/bm15/dao/BlankDatabaseManagement;->context:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/blank/bm15/model/object/crud/League;-><init>(Landroid/content/Context;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 109
    new-instance v1, Lcom/blank/bm15/model/object/crud/DraftRound;

    iget-object v2, p0, Lcom/blank/bm15/dao/BlankDatabaseManagement;->context:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/blank/bm15/model/object/crud/DraftRound;-><init>(Landroid/content/Context;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 110
    new-instance v1, Lcom/blank/bm15/model/object/crud/News;

    iget-object v2, p0, Lcom/blank/bm15/dao/BlankDatabaseManagement;->context:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/blank/bm15/model/object/crud/News;-><init>(Landroid/content/Context;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 111
    new-instance v1, Lcom/blank/bm15/model/object/crud/Match;

    iget-object v2, p0, Lcom/blank/bm15/dao/BlankDatabaseManagement;->context:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/blank/bm15/model/object/crud/Match;-><init>(Landroid/content/Context;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 112
    new-instance v1, Lcom/blank/bm15/model/object/crud/MatchResult;

    iget-object v2, p0, Lcom/blank/bm15/dao/BlankDatabaseManagement;->context:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/blank/bm15/model/object/crud/MatchResult;-><init>(Landroid/content/Context;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 113
    new-instance v1, Lcom/blank/bm15/model/object/crud/Offer;

    iget-object v2, p0, Lcom/blank/bm15/dao/BlankDatabaseManagement;->context:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/blank/bm15/model/object/crud/Offer;-><init>(Landroid/content/Context;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 114
    new-instance v1, Lcom/blank/bm15/model/object/crud/Trade;

    iget-object v2, p0, Lcom/blank/bm15/dao/BlankDatabaseManagement;->context:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/blank/bm15/model/object/crud/Trade;-><init>(Landroid/content/Context;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 115
    new-instance v1, Lcom/blank/bm15/model/object/crud/Playoffs;

    iget-object v2, p0, Lcom/blank/bm15/dao/BlankDatabaseManagement;->context:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/blank/bm15/model/object/crud/Playoffs;-><init>(Landroid/content/Context;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 117
    return-object v0
.end method

.method private loadTables(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 126
    return-void
.end method


# virtual methods
.method public getDatabaseName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lcom/blank/bm15/dao/BlankDatabaseManagement;->databaseName:Ljava/lang/String;

    return-object v0
.end method

.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 3
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 68
    invoke-direct {p0}, Lcom/blank/bm15/dao/BlankDatabaseManagement;->getBlankBaseObjects()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 72
    invoke-direct {p0, p1}, Lcom/blank/bm15/dao/BlankDatabaseManagement;->loadTables(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 73
    return-void

    .line 68
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blank/bm15/dao/utils/BlankBase;

    .line 69
    .local v0, "obj":Lcom/blank/bm15/dao/utils/BlankBase;
    invoke-static {v0}, Lcom/blank/bm15/dao/BlankDao;->getQueryCreate(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 5
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "oldVersion"    # I
    .param p3, "newVersion"    # I

    .prologue
    .line 77
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 79
    .local v1, "list":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Lcom/blank/bm15/dao/utils/BlankBase;>;>;"
    invoke-direct {p0}, Lcom/blank/bm15/dao/BlankDatabaseManagement;->getBlankBaseObjects()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_0

    .line 84
    invoke-direct {p0}, Lcom/blank/bm15/dao/BlankDatabaseManagement;->getBlankBaseObjects()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_1

    .line 88
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_2

    .line 91
    return-void

    .line 79
    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/blank/bm15/dao/utils/BlankBase;

    .line 80
    .local v2, "obj":Lcom/blank/bm15/dao/utils/BlankBase;
    invoke-static {p1, v2}, Lcom/blank/bm15/dao/BlankDao;->getAll(Landroid/database/sqlite/SQLiteDatabase;Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 81
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->getQueryDelete(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    goto :goto_0

    .line 84
    .end local v2    # "obj":Lcom/blank/bm15/dao/utils/BlankBase;
    :cond_1
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/blank/bm15/dao/utils/BlankBase;

    .line 85
    .restart local v2    # "obj":Lcom/blank/bm15/dao/utils/BlankBase;
    invoke-static {v2}, Lcom/blank/bm15/dao/BlankDao;->getQueryCreate(Lcom/blank/bm15/dao/utils/BlankBase;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    goto :goto_1

    .line 88
    .end local v2    # "obj":Lcom/blank/bm15/dao/utils/BlankBase;
    :cond_2
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 89
    .local v0, "aux":Ljava/util/List;, "Ljava/util/List<Lcom/blank/bm15/dao/utils/BlankBase;>;"
    invoke-static {p1, v0}, Lcom/blank/bm15/dao/BlankDao;->saveOrUpdateAll(Landroid/database/sqlite/SQLiteDatabase;Ljava/util/List;)V

    goto :goto_2
.end method
