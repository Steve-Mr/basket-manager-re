.class Lcom/blank/bm15/activity/adapter/AdapterNewsList$NewsHolder;
.super Ljava/lang/Object;
.source "AdapterNewsList.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/blank/bm15/activity/adapter/AdapterNewsList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "NewsHolder"
.end annotation


# instance fields
.field public image:Landroid/widget/ImageView;

.field public textViewBody:Landroid/widget/TextView;

.field public textViewMatchDay:Landroid/widget/TextView;

.field public textViewTitle:Landroid/widget/TextView;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 97
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
