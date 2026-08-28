package com.blank.bm15.model.comparator;

import com.blank.bm15.model.object.other.WorstPosition;
import java.util.Comparator;

/* JADX INFO: loaded from: classes.dex */
public class WorstPositionComparator implements Comparator<WorstPosition> {
    public static final int ORDER_BY_VALUE = 0;
    public static final int ORDER_TYPE_ASC = 1;
    private Integer orderBy;
    private Integer orderType;

    public WorstPositionComparator(int orderBy, int orderType) {
        this.orderBy = Integer.valueOf(orderBy);
        this.orderType = Integer.valueOf(orderType);
    }

    @Override // java.util.Comparator
    public int compare(WorstPosition p1, WorstPosition p2) {
        if (this.orderBy.intValue() == 0) {
            return this.orderType.intValue() * p1.getAverageValue().compareTo(p2.getAverageValue());
        }
        return 0;
    }
}
