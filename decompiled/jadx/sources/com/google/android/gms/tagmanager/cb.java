package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.d;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
class cb extends aj {
    private static final String ID = com.google.android.gms.internal.a.PLATFORM.toString();
    private static final d.a YM = dh.r("Android");

    public cb() {
        super(ID, new String[0]);
    }

    @Override // com.google.android.gms.tagmanager.aj
    public boolean jX() {
        return true;
    }

    @Override // com.google.android.gms.tagmanager.aj
    public d.a x(Map<String, d.a> map) {
        return YM;
    }
}
