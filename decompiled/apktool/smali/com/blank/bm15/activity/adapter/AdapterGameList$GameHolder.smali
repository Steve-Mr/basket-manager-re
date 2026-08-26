.class Lcom/blank/bm15/activity/adapter/AdapterGameList$GameHolder;
.super Ljava/lang/Object;
.source "AdapterGameList.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/blank/bm15/activity/adapter/AdapterGameList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "GameHolder"
.end annotation


# instance fields
.field public textViewCurrentMatchday:Landroid/widget/TextView;

.field public textViewCurrentSeason:Landroid/widget/TextView;

.field public textViewName:Landroid/widget/TextView;

.field public textViewTeam:Landroid/widget/TextView;

.field public viewTeamColor:Landroid/view/View;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
