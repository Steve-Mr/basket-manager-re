package com.blank.bm15.dao.utils;

import android.content.Context;

/* JADX INFO: loaded from: classes.dex */
public class BlankBase {
    private Context context;
    private Integer id;
    private Boolean tempLoaded = Boolean.FALSE;

    public BlankBase(Context context) {
        this.context = context;
    }

    public Context getContext() {
        return this.context;
    }

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Boolean isNotLoaded() {
        return Boolean.valueOf(!this.tempLoaded.booleanValue());
    }

    public void load() {
        this.tempLoaded = Boolean.TRUE;
    }

    public boolean equals(Object obj) {
        if (obj instanceof BlankBase) {
            BlankBase object = (BlankBase) obj;
            if (getId() != null && object.getId() != null && getId().intValue() == object.getId().intValue()) {
                return Boolean.TRUE.booleanValue();
            }
        }
        return Boolean.FALSE.booleanValue();
    }
}
