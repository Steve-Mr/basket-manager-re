package com.google.android.gms.tagmanager;

import android.content.Context;
import com.google.android.gms.internal.d;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
class f extends aj {
    private static final String ID = com.google.android.gms.internal.a.APP_ID.toString();
    private final Context mContext;

    public f(Context context) {
        super(ID, new String[0]);
        this.mContext = context;
    }

    @Override // com.google.android.gms.tagmanager.aj
    public boolean jX() {
        return true;
    }

    @Override // com.google.android.gms.tagmanager.aj
    public d.a x(Map<String, d.a> map) {
        return dh.r(this.mContext.getPackageName());
    }
}
