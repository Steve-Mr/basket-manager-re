package com.google.android.gms.tagmanager;

import android.util.Base64;
import com.google.android.gms.internal.d;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
class ac extends aj {
    private static final String ID = com.google.android.gms.internal.a.ENCODE.toString();
    private static final String XQ = com.google.android.gms.internal.b.ARG0.toString();
    private static final String XR = com.google.android.gms.internal.b.NO_PADDING.toString();
    private static final String XS = com.google.android.gms.internal.b.INPUT_FORMAT.toString();
    private static final String XT = com.google.android.gms.internal.b.OUTPUT_FORMAT.toString();

    public ac() {
        super(ID, XQ);
    }

    @Override // com.google.android.gms.tagmanager.aj
    public boolean jX() {
        return true;
    }

    @Override // com.google.android.gms.tagmanager.aj
    public d.a x(Map<String, d.a> map) {
        byte[] bArrDecode;
        String strEncodeToString;
        d.a aVar = map.get(XQ);
        if (aVar == null || aVar == dh.lT()) {
            return dh.lT();
        }
        String strJ = dh.j(aVar);
        d.a aVar2 = map.get(XS);
        String strJ2 = aVar2 == null ? "text" : dh.j(aVar2);
        d.a aVar3 = map.get(XT);
        String strJ3 = aVar3 == null ? "base16" : dh.j(aVar3);
        d.a aVar4 = map.get(XR);
        int i = (aVar4 == null || !dh.n(aVar4).booleanValue()) ? 2 : 3;
        try {
            if ("text".equals(strJ2)) {
                bArrDecode = strJ.getBytes();
            } else if ("base16".equals(strJ2)) {
                bArrDecode = j.bm(strJ);
            } else if ("base64".equals(strJ2)) {
                bArrDecode = Base64.decode(strJ, i);
            } else {
                if (!"base64url".equals(strJ2)) {
                    bh.w("Encode: unknown input format: " + strJ2);
                    return dh.lT();
                }
                bArrDecode = Base64.decode(strJ, i | 8);
            }
            if ("base16".equals(strJ3)) {
                strEncodeToString = j.d(bArrDecode);
            } else if ("base64".equals(strJ3)) {
                strEncodeToString = Base64.encodeToString(bArrDecode, i);
            } else {
                if (!"base64url".equals(strJ3)) {
                    bh.w("Encode: unknown output format: " + strJ3);
                    return dh.lT();
                }
                strEncodeToString = Base64.encodeToString(bArrDecode, i | 8);
            }
            return dh.r(strEncodeToString);
        } catch (IllegalArgumentException e) {
            bh.w("Encode: invalid input:");
            return dh.lT();
        }
    }
}
