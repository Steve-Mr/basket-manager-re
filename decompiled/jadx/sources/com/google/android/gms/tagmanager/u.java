package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.d;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
class u extends aj {
    private static final String ID = com.google.android.gms.internal.a.CUSTOM_VAR.toString();
    private static final String NAME = com.google.android.gms.internal.b.NAME.toString();
    private static final String XA = com.google.android.gms.internal.b.DEFAULT_VALUE.toString();
    private final DataLayer WK;

    public u(DataLayer dataLayer) {
        super(ID, NAME);
        this.WK = dataLayer;
    }

    @Override // com.google.android.gms.tagmanager.aj
    public boolean jX() {
        return false;
    }

    @Override // com.google.android.gms.tagmanager.aj
    public d.a x(Map<String, d.a> map) {
        Object obj = this.WK.get(dh.j(map.get(NAME)));
        if (obj != null) {
            return dh.r(obj);
        }
        d.a aVar = map.get(XA);
        return aVar != null ? aVar : dh.lT();
    }
}
