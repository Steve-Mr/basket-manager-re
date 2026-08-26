package com.google.android.gms.tagmanager;

import android.content.Context;
import com.google.android.gms.internal.d;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
class ax extends aj {
    private static final String ID = com.google.android.gms.internal.a.INSTALL_REFERRER.toString();
    private static final String WA = com.google.android.gms.internal.b.COMPONENT.toString();
    private final Context kI;

    public ax(Context context) {
        super(ID, new String[0]);
        this.kI = context;
    }

    @Override // com.google.android.gms.tagmanager.aj
    public boolean jX() {
        return true;
    }

    @Override // com.google.android.gms.tagmanager.aj
    public d.a x(Map<String, d.a> map) {
        String strD = ay.d(this.kI, map.get(WA) != null ? dh.j(map.get(WA)) : null);
        return strD != null ? dh.r(strD) : dh.lT();
    }
}
