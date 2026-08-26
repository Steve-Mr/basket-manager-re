package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.d;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

/* JADX INFO: loaded from: classes.dex */
abstract class aj {
    private final Set<String> XU;
    private final String XV;

    public aj(String str, String... strArr) {
        this.XV = str;
        this.XU = new HashSet(strArr.length);
        for (String str2 : strArr) {
            this.XU.add(str2);
        }
    }

    boolean a(Set<String> set) {
        return set.containsAll(this.XU);
    }

    public abstract boolean jX();

    public String kB() {
        return this.XV;
    }

    public Set<String> kC() {
        return this.XU;
    }

    public abstract d.a x(Map<String, d.a> map);
}
