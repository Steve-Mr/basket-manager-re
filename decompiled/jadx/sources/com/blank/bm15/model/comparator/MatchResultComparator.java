package com.blank.bm15.model.comparator;

import com.blank.bm15.model.object.crud.MatchResult;
import java.util.Comparator;

/* JADX INFO: loaded from: classes.dex */
public class MatchResultComparator implements Comparator<MatchResult> {
    public static final int ORDER_BY_PER = 0;
    public static final int ORDER_BY_STATISTICS = 1;
    public static final int ORDER_TYPE_ASC = 1;
    public static final int ORDER_TYPE_DESC = -1;
    private Integer orderBy;
    private Integer orderType;

    public MatchResultComparator(int orderBy, int orderType) {
        this.orderBy = Integer.valueOf(orderBy);
        this.orderType = Integer.valueOf(orderType);
    }

    @Override // java.util.Comparator
    public int compare(MatchResult p1, MatchResult p2) {
        if (this.orderBy.intValue() == 0) {
            return this.orderType.intValue() * p1.getPer().compareTo(p2.getPer());
        }
        if (this.orderBy.intValue() == 1) {
            Integer intP1 = Integer.valueOf((p1.getMinutesPlayed().intValue() / p1.getMatches().intValue() == 0 ? 1 : p1.getMatches().intValue() / 10) + (p1.getMatches().intValue() / 10) + p1.getPer().intValue());
            Integer intP2 = Integer.valueOf(p2.getPer().intValue() + (p2.getMatches().intValue() / 10) + (p2.getMinutesPlayed().intValue() / p2.getMatches().intValue() != 0 ? p2.getMatches().intValue() / 10 : 1));
            return this.orderType.intValue() * intP1.compareTo(intP2);
        }
        return 0;
    }
}
