package com.blank.bm15.model.comparator;

import com.blank.bm15.model.object.crud.DraftRound;
import java.util.Comparator;

/* JADX INFO: loaded from: classes.dex */
public class DraftRoundComparator implements Comparator<DraftRound> {
    public static final int ORDER_BY_POSITION = 0;
    public static final int ORDER_TYPE_ASC = 1;
    private Integer orderBy;
    private Integer orderType;

    public DraftRoundComparator(int orderBy, int orderType) {
        this.orderBy = Integer.valueOf(orderBy);
        this.orderType = Integer.valueOf(orderType);
    }

    @Override // java.util.Comparator
    public int compare(DraftRound p1, DraftRound p2) {
        if (this.orderBy.intValue() == 0) {
            return this.orderType.intValue() * p1.getPosition().compareTo(p2.getPosition());
        }
        return 0;
    }
}
