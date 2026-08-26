package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.d;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
abstract class dc extends cc {
    public dc(String str) {
        super(str);
    }

    @Override // com.google.android.gms.tagmanager.cc
    protected boolean a(d.a aVar, d.a aVar2, Map<String, d.a> map) {
        String strJ = dh.j(aVar);
        String strJ2 = dh.j(aVar2);
        if (strJ == dh.lS() || strJ2 == dh.lS()) {
            return false;
        }
        return a(strJ, strJ2, map);
    }

    protected abstract boolean a(String str, String str2, Map<String, d.a> map);
}
