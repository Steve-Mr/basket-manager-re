package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.d;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

/* JADX INFO: loaded from: classes.dex */
class dk {
    private static by<d.a> a(by<d.a> byVar) {
        try {
            return new by<>(dh.r(cd(dh.j(byVar.getObject()))), byVar.kQ());
        } catch (UnsupportedEncodingException e) {
            bh.b("Escape URI: unsupported encoding", e);
            return byVar;
        }
    }

    private static by<d.a> a(by<d.a> byVar, int i) {
        if (!q(byVar.getObject())) {
            bh.w("Escaping can only be applied to strings.");
            return byVar;
        }
        switch (i) {
            case 12:
                break;
            default:
                bh.w("Unsupported Value Escaping: " + i);
                break;
        }
        return byVar;
    }

    static by<d.a> a(by<d.a> byVar, int... iArr) {
        for (int i : iArr) {
            byVar = a(byVar, i);
        }
        return byVar;
    }

    static String cd(String str) throws UnsupportedEncodingException {
        return URLEncoder.encode(str, "UTF-8").replaceAll("\\+", "%20");
    }

    private static boolean q(d.a aVar) {
        return dh.o(aVar) instanceof String;
    }
}
