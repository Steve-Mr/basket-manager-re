package com.google.android.gms.cast;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.images.WebImage;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.internal.eo;
import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class CastDevice implements SafeParcelable {
    public static final Parcelable.Creator<CastDevice> CREATOR = new b();
    private final int xH;
    private String ya;
    String yb;
    private Inet4Address yc;
    private String yd;
    private String ye;
    private String yf;
    private int yg;
    private List<WebImage> yh;

    private CastDevice() {
        this(1, null, null, null, null, null, -1, new ArrayList());
    }

    CastDevice(int versionCode, String deviceId, String hostAddress, String friendlyName, String modelName, String deviceVersion, int servicePort, List<WebImage> icons) {
        this.xH = versionCode;
        this.ya = deviceId;
        this.yb = hostAddress;
        if (this.yb != null) {
            try {
                InetAddress byName = InetAddress.getByName(this.yb);
                if (byName instanceof Inet4Address) {
                    this.yc = (Inet4Address) byName;
                }
            } catch (UnknownHostException e) {
                this.yc = null;
            }
        }
        this.yd = friendlyName;
        this.ye = modelName;
        this.yf = deviceVersion;
        this.yg = servicePort;
        this.yh = icons;
    }

    public static CastDevice getFromBundle(Bundle extras) {
        if (extras == null) {
            return null;
        }
        extras.setClassLoader(CastDevice.class.getClassLoader());
        return (CastDevice) extras.getParcelable("com.google.android.gms.cast.EXTRA_CAST_DEVICE");
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof CastDevice)) {
            return false;
        }
        CastDevice castDevice = (CastDevice) obj;
        return getDeviceId() == null ? castDevice.getDeviceId() == null : eo.a(this.ya, castDevice.ya) && eo.a(this.yc, castDevice.yc) && eo.a(this.ye, castDevice.ye) && eo.a(this.yd, castDevice.yd) && eo.a(this.yf, castDevice.yf) && this.yg == castDevice.yg && eo.a(this.yh, castDevice.yh);
    }

    public String getDeviceId() {
        return this.ya;
    }

    public String getDeviceVersion() {
        return this.yf;
    }

    public String getFriendlyName() {
        return this.yd;
    }

    /* JADX WARN: Removed duplicated region for block: B:34:0x0072  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public com.google.android.gms.common.images.WebImage getIcon(int r10, int r11) {
        /*
            r9 = this;
            r7 = 0
            r1 = 0
            java.util.List<com.google.android.gms.common.images.WebImage> r0 = r9.yh
            boolean r0 = r0.isEmpty()
            if (r0 == 0) goto Lb
        La:
            return r1
        Lb:
            if (r10 <= 0) goto Lf
            if (r11 > 0) goto L19
        Lf:
            java.util.List<com.google.android.gms.common.images.WebImage> r0 = r9.yh
            java.lang.Object r0 = r0.get(r7)
            com.google.android.gms.common.images.WebImage r0 = (com.google.android.gms.common.images.WebImage) r0
            r1 = r0
            goto La
        L19:
            java.util.List<com.google.android.gms.common.images.WebImage> r0 = r9.yh
            java.util.Iterator r3 = r0.iterator()
            r2 = r1
        L20:
            boolean r0 = r3.hasNext()
            if (r0 == 0) goto L60
            java.lang.Object r0 = r3.next()
            com.google.android.gms.common.images.WebImage r0 = (com.google.android.gms.common.images.WebImage) r0
            int r4 = r0.getWidth()
            int r5 = r0.getHeight()
            if (r4 < r10) goto L4c
            if (r5 < r11) goto L4c
            if (r2 == 0) goto L46
            int r6 = r2.getWidth()
            if (r6 <= r4) goto L72
            int r4 = r2.getHeight()
            if (r4 <= r5) goto L72
        L46:
            r8 = r1
            r1 = r0
            r0 = r8
        L49:
            r2 = r1
            r1 = r0
            goto L20
        L4c:
            if (r4 >= r10) goto L72
            if (r5 >= r11) goto L72
            if (r1 == 0) goto L5e
            int r6 = r1.getWidth()
            if (r6 >= r4) goto L72
            int r4 = r1.getHeight()
            if (r4 >= r5) goto L72
        L5e:
            r1 = r2
            goto L49
        L60:
            if (r2 == 0) goto L64
        L62:
            r1 = r2
            goto La
        L64:
            if (r1 == 0) goto L68
            r2 = r1
            goto L62
        L68:
            java.util.List<com.google.android.gms.common.images.WebImage> r0 = r9.yh
            java.lang.Object r0 = r0.get(r7)
            com.google.android.gms.common.images.WebImage r0 = (com.google.android.gms.common.images.WebImage) r0
            r2 = r0
            goto L62
        L72:
            r0 = r1
            r1 = r2
            goto L49
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.cast.CastDevice.getIcon(int, int):com.google.android.gms.common.images.WebImage");
    }

    public List<WebImage> getIcons() {
        return Collections.unmodifiableList(this.yh);
    }

    public Inet4Address getIpAddress() {
        return this.yc;
    }

    public String getModelName() {
        return this.ye;
    }

    public int getServicePort() {
        return this.yg;
    }

    int getVersionCode() {
        return this.xH;
    }

    public boolean hasIcons() {
        return !this.yh.isEmpty();
    }

    public int hashCode() {
        if (this.ya == null) {
            return 0;
        }
        return this.ya.hashCode();
    }

    public boolean isSameDevice(CastDevice castDevice) {
        if (castDevice == null) {
            return false;
        }
        return getDeviceId() == null ? castDevice.getDeviceId() == null : eo.a(getDeviceId(), castDevice.getDeviceId());
    }

    public void putInBundle(Bundle bundle) {
        if (bundle == null) {
            return;
        }
        bundle.putParcelable("com.google.android.gms.cast.EXTRA_CAST_DEVICE", this);
    }

    public String toString() {
        return String.format("\"%s\" (%s)", this.yd, this.ya);
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel out, int flags) {
        b.a(this, out, flags);
    }
}
