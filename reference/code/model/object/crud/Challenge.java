package com.blank.bm15.model.object.crud;

import android.content.Context;
import com.blank.bm15.dao.utils.BlankBase;

/* loaded from: classes.dex */
public class Challenge extends BlankBase {
    private Boolean acquired;
    private Integer season;
    private String teamName;

    public Challenge(Context context) {
        super(context);
    }

    public String getTeamName() {
        return this.teamName;
    }

    public void setTeamName(String teamName) {
        this.teamName = teamName;
    }

    public Integer getSeason() {
        return this.season;
    }

    public void setSeason(Integer season) {
        this.season = season;
    }

    public Boolean getAcquired() {
        if (this.acquired == null) {
            this.acquired = Boolean.FALSE;
        }
        return this.acquired;
    }

    public void setAcquired(Boolean acquired) {
        this.acquired = acquired;
    }
}
