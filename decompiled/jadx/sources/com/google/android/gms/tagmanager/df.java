package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.d;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
abstract class df extends aj {
    public df(String str, String... strArr) {
        super(str, strArr);
    }

    @Override // com.google.android.gms.tagmanager.aj
    public boolean jX() {
        return false;
    }

    @Override // com.google.android.gms.tagmanager.aj
    public d.a x(Map<String, d.a> map) {
        z(map);
        return dh.lT();
    }

    public abstract void z(Map<String, d.a> map);
}
