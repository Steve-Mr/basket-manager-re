package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.d;
import java.util.Iterator;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
abstract class cc extends aj {
    private static final String XQ = com.google.android.gms.internal.b.ARG0.toString();
    private static final String YN = com.google.android.gms.internal.b.ARG1.toString();

    public cc(String str) {
        super(str, XQ, YN);
    }

    protected abstract boolean a(d.a aVar, d.a aVar2, Map<String, d.a> map);

    @Override // com.google.android.gms.tagmanager.aj
    public boolean jX() {
        return true;
    }

    @Override // com.google.android.gms.tagmanager.aj
    public d.a x(Map<String, d.a> map) {
        Iterator<d.a> it = map.values().iterator();
        while (it.hasNext()) {
            if (it.next() == dh.lT()) {
                return dh.r(false);
            }
        }
        d.a aVar = map.get(XQ);
        d.a aVar2 = map.get(YN);
        return dh.r(Boolean.valueOf((aVar == null || aVar2 == null) ? false : a(aVar, aVar2, map)));
    }
}
