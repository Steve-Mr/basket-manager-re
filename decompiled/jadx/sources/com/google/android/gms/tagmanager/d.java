package com.google.android.gms.tagmanager;

import android.content.Context;
import android.net.Uri;
import com.google.android.gms.plus.PlusShare;
import com.google.android.gms.tagmanager.DataLayer;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
class d implements DataLayer.b {
    private final Context kI;

    public d(Context context) {
        this.kI = context;
    }

    @Override // com.google.android.gms.tagmanager.DataLayer.b
    public void y(Map<String, Object> map) {
        String queryParameter;
        Object obj;
        Object obj2 = map.get("gtm.url");
        Object obj3 = (obj2 == null && (obj = map.get("gtm")) != null && (obj instanceof Map)) ? ((Map) obj).get(PlusShare.KEY_CALL_TO_ACTION_URL) : obj2;
        if (obj3 == null || !(obj3 instanceof String) || (queryParameter = Uri.parse((String) obj3).getQueryParameter("referrer")) == null) {
            return;
        }
        ay.e(this.kI, queryParameter);
    }
}
