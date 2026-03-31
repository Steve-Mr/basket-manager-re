package com.blank.bm15.model.object.other;

/* loaded from: classes.dex */
public class WorstPosition {
    private Integer averageValue;
    private Integer position;

    public WorstPosition(Integer position, Integer averageValue) {
        this.position = position;
        this.averageValue = averageValue;
    }

    public Integer getPosition() {
        return this.position;
    }

    public void setPosition(Integer position) {
        this.position = position;
    }

    public Integer getAverageValue() {
        return this.averageValue;
    }

    public void setAverageValue(Integer averageValue) {
        this.averageValue = averageValue;
    }
}
