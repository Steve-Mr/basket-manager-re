.class public Lcom/blank/bm15/model/object/other/DrawerItem;
.super Ljava/lang/Object;
.source "DrawerItem.java"


# static fields
.field public static final ITEM_GAME_ANALIZE:I = 0x4

.field public static final ITEM_GAME_PLAY_1:I = 0x1

.field public static final ITEM_GAME_PLAY_30:I = 0x3

.field public static final ITEM_GAME_PLAY_7:I = 0x2

.field public static final ITEM_MANAGEMENT_CALENDAR:I = 0xe

.field public static final ITEM_MANAGEMENT_CLASSIFICATION:I = 0xd

.field public static final ITEM_MANAGEMENT_NEWS:I = 0xf

.field public static final ITEM_MANAGEMENT_PLAYER:I = 0xb

.field public static final ITEM_MANAGEMENT_PLAYOFFS:I = 0xc

.field public static final ITEM_MANAGEMENT_TEAM:I = 0xa

.field public static final ITEM_MARKET_DRAFT:I = 0x15

.field public static final ITEM_MARKET_FINANCES:I = 0x18

.field public static final ITEM_MARKET_FREE_AGENTS:I = 0x17

.field public static final ITEM_MARKET_RENEWAL:I = 0x14

.field public static final ITEM_MARKET_TRADE:I = 0x16

.field public static final ITEM_OTHER_CHALLENGE:I = 0x29

.field public static final ITEM_OTHER_EXIT:I = 0x28

.field public static final ITEM_OTHER_GUIDE:I = 0x2a

.field public static final ITEM_TOP_100:I = 0x1e

.field public static final ITEM_TOP_ROOKIES:I = 0x1f


# instance fields
.field private icon:Ljava/lang/Integer;

.field private id:Ljava/lang/Integer;

.field private text:Ljava/lang/String;

.field private title:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "id"    # Ljava/lang/Integer;
    .param p2, "icon"    # Ljava/lang/Integer;
    .param p3, "title"    # Ljava/lang/String;
    .param p4, "text"    # Ljava/lang/String;

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/DrawerItem;->id:Ljava/lang/Integer;

    .line 37
    iput-object p2, p0, Lcom/blank/bm15/model/object/other/DrawerItem;->icon:Ljava/lang/Integer;

    .line 38
    iput-object p3, p0, Lcom/blank/bm15/model/object/other/DrawerItem;->title:Ljava/lang/String;

    .line 39
    iput-object p4, p0, Lcom/blank/bm15/model/object/other/DrawerItem;->text:Ljava/lang/String;

    .line 40
    return-void
.end method


# virtual methods
.method public getIcon()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/DrawerItem;->icon:Ljava/lang/Integer;

    return-object v0
.end method

.method public getId()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 43
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/DrawerItem;->id:Ljava/lang/Integer;

    return-object v0
.end method

.method public getText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 67
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/DrawerItem;->text:Ljava/lang/String;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lcom/blank/bm15/model/object/other/DrawerItem;->title:Ljava/lang/String;

    return-object v0
.end method

.method public setIcon(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "icon"    # Ljava/lang/Integer;

    .prologue
    .line 55
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/DrawerItem;->icon:Ljava/lang/Integer;

    .line 56
    return-void
.end method

.method public setId(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "id"    # Ljava/lang/Integer;

    .prologue
    .line 47
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/DrawerItem;->id:Ljava/lang/Integer;

    .line 48
    return-void
.end method

.method public setText(Ljava/lang/String;)V
    .locals 0
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 71
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/DrawerItem;->text:Ljava/lang/String;

    .line 72
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 0
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 63
    iput-object p1, p0, Lcom/blank/bm15/model/object/other/DrawerItem;->title:Ljava/lang/String;

    .line 64
    return-void
.end method
