package com.google.android.gms.maps.model;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;

/* JADX INFO: loaded from: classes.dex */
public class GroundOverlayOptionsCreator implements Parcelable.Creator<GroundOverlayOptions> {
    public static final int CONTENT_DESCRIPTION = 0;

    static void a(GroundOverlayOptions groundOverlayOptions, Parcel parcel, int i) {
        int iP = com.google.android.gms.common.internal.safeparcel.b.p(parcel);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1, groundOverlayOptions.getVersionCode());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 2, groundOverlayOptions.iD(), false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 3, (Parcelable) groundOverlayOptions.getLocation(), i, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 4, groundOverlayOptions.getWidth());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 5, groundOverlayOptions.getHeight());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 6, (Parcelable) groundOverlayOptions.getBounds(), i, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 7, groundOverlayOptions.getBearing());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 8, groundOverlayOptions.getZIndex());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 9, groundOverlayOptions.isVisible());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 10, groundOverlayOptions.getTransparency());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 11, groundOverlayOptions.getAnchorU());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 12, groundOverlayOptions.getAnchorV());
        com.google.android.gms.common.internal.safeparcel.b.F(parcel, iP);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // android.os.Parcelable.Creator
    public GroundOverlayOptions createFromParcel(Parcel parcel) {
        int iO = com.google.android.gms.common.internal.safeparcel.a.o(parcel);
        int iG = 0;
        IBinder iBinderO = null;
        LatLng latLng = null;
        float fK = 0.0f;
        float fK2 = 0.0f;
        LatLngBounds latLngBounds = null;
        float fK3 = 0.0f;
        float fK4 = 0.0f;
        boolean zC = false;
        float fK5 = 0.0f;
        float fK6 = 0.0f;
        float fK7 = 0.0f;
        while (parcel.dataPosition() < iO) {
            int iN = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.a.R(iN)) {
                case 1:
                    iG = com.google.android.gms.common.internal.safeparcel.a.g(parcel, iN);
                    break;
                case 2:
                    iBinderO = com.google.android.gms.common.internal.safeparcel.a.o(parcel, iN);
                    break;
                case 3:
                    latLng = (LatLng) com.google.android.gms.common.internal.safeparcel.a.a(parcel, iN, LatLng.CREATOR);
                    break;
                case 4:
                    fK = com.google.android.gms.common.internal.safeparcel.a.k(parcel, iN);
                    break;
                case 5:
                    fK2 = com.google.android.gms.common.internal.safeparcel.a.k(parcel, iN);
                    break;
                case 6:
                    latLngBounds = (LatLngBounds) com.google.android.gms.common.internal.safeparcel.a.a(parcel, iN, LatLngBounds.CREATOR);
                    break;
                case 7:
                    fK3 = com.google.android.gms.common.internal.safeparcel.a.k(parcel, iN);
                    break;
                case 8:
                    fK4 = com.google.android.gms.common.internal.safeparcel.a.k(parcel, iN);
                    break;
                case 9:
                    zC = com.google.android.gms.common.internal.safeparcel.a.c(parcel, iN);
                    break;
                case 10:
                    fK5 = com.google.android.gms.common.internal.safeparcel.a.k(parcel, iN);
                    break;
                case 11:
                    fK6 = com.google.android.gms.common.internal.safeparcel.a.k(parcel, iN);
                    break;
                case 12:
                    fK7 = com.google.android.gms.common.internal.safeparcel.a.k(parcel, iN);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.a.b(parcel, iN);
                    break;
            }
        }
        if (parcel.dataPosition() != iO) {
            throw new a.C0019a("Overread allowed size end=" + iO, parcel);
        }
        return new GroundOverlayOptions(iG, iBinderO, latLng, fK, fK2, latLngBounds, fK3, fK4, zC, fK5, fK6, fK7);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // android.os.Parcelable.Creator
    public GroundOverlayOptions[] newArray(int size) {
        return new GroundOverlayOptions[size];
    }
}
