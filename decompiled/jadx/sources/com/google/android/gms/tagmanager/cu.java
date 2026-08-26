package com.google.android.gms.tagmanager;

import android.os.Build;
import com.google.android.gms.internal.d;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
class cu extends aj {
    private static final String ID = com.google.android.gms.internal.a.SDK_VERSION.toString();

    public cu() {
        super(ID, new String[0]);
    }

    @Override // com.google.android.gms.tagmanager.aj
    public boolean jX() {
        return true;
    }

    @Override // com.google.android.gms.tagmanager.aj
    public d.a x(Map<String, d.a> map) {
        return dh.r(Integer.valueOf(Build.VERSION.SDK_INT));
    }
}
