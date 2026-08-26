package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.d;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
abstract class bx extends cc {
    public bx(String str) {
        super(str);
    }

    @Override // com.google.android.gms.tagmanager.cc
    protected boolean a(d.a aVar, d.a aVar2, Map<String, d.a> map) {
        dg dgVarK = dh.k(aVar);
        dg dgVarK2 = dh.k(aVar2);
        if (dgVarK == dh.lR() || dgVarK2 == dh.lR()) {
            return false;
        }
        return a(dgVarK, dgVarK2, map);
    }

    protected abstract boolean a(dg dgVar, dg dgVar2, Map<String, d.a> map);
}
