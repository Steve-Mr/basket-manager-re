package com.blank.bm15.model.object.other;

import android.content.Context;
import com.blank.bm15.model.object.crud.League;

/* loaded from: classes.dex */
public class Classification extends League {
    private Integer conference;
    private Integer division;
    private Boolean isClassified;
    private String name;
    private Integer positionInConference;
    private Integer positionInDivision;

    public Classification(Context context) {
        super(context);
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getConference() {
        return this.conference;
    }

    public void setConference(Integer conference) {
        this.conference = conference;
    }

    public Integer getDivision() {
        return this.division;
    }

    public void setDivision(Integer division) {
        this.division = division;
    }

    public Integer getPositionInConference() {
        return this.positionInConference;
    }

    public void setPositionInConference(Integer positionInConference) {
        this.positionInConference = positionInConference;
    }

    public Integer getPositionInDivision() {
        return this.positionInDivision;
    }

    public void setPositionInDivision(Integer positionInDivision) {
        this.positionInDivision = positionInDivision;
    }

    public Boolean getIsClassified() {
        return this.isClassified;
    }

    public void setIsClassified(Boolean isClassified) {
        this.isClassified = isClassified;
    }
}
