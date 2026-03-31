package com.blank.bm15.model.object.crud;

import android.content.Context;
import com.blank.bm15.dao.utils.BlankBase;

/* loaded from: classes.dex */
public class Navigation extends BlankBase {
    private Integer idFragment;
    private Integer idObject;

    public Navigation(Context context) {
        super(context);
    }

    public Integer getIdFragment() {
        return this.idFragment;
    }

    public void setIdFragment(Integer idFragment) {
        this.idFragment = idFragment;
    }

    public Integer getIdObject() {
        return this.idObject;
    }

    public void setIdObject(Integer idObject) {
        this.idObject = idObject;
    }
}
