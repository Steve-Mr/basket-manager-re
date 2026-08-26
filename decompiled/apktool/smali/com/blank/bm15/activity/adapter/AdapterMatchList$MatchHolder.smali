.class Lcom/blank/bm15/activity/adapter/AdapterMatchList$MatchHolder;
.super Ljava/lang/Object;
.source "AdapterMatchList.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/blank/bm15/activity/adapter/AdapterMatchList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "MatchHolder"
.end annotation


# instance fields
.field public textViewSeparator:Landroid/widget/TextView;

.field public textViewTeamLocalName:Landroid/widget/TextView;

.field public textViewTeamLocalResult:Landroid/widget/TextView;

.field public textViewTeamVisitorName:Landroid/widget/TextView;

.field public textViewTeamVisitorResult:Landroid/widget/TextView;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 113
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
