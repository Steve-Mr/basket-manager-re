package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.d;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
class dd extends aj {
    private static final String ID = com.google.android.gms.internal.a.TIME.toString();

    public dd() {
        super(ID, new String[0]);
    }

    @Override // com.google.android.gms.tagmanager.aj
    public boolean jX() {
        return false;
    }

    @Override // com.google.android.gms.tagmanager.aj
    public d.a x(Map<String, d.a> map) {
        return dh.r(Long.valueOf(System.currentTimeMillis()));
    }
}
