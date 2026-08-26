package com.blank.bm15.model.comparator;

import com.blank.bm15.model.object.crud.Challenge;
import java.util.Comparator;

/* JADX INFO: loaded from: classes.dex */
public class ChallengeComparator implements Comparator<Challenge> {
    public static final int ORDER_BY_NAME = 0;
    public static final int ORDER_TYPE_ASC = 1;
    private Integer orderBy;
    private Integer orderType;

    public ChallengeComparator(int orderBy, int orderType) {
        this.orderBy = Integer.valueOf(orderBy);
        this.orderType = Integer.valueOf(orderType);
    }

    @Override // java.util.Comparator
    public int compare(Challenge p1, Challenge p2) {
        if (this.orderBy.intValue() == 0) {
            return this.orderType.intValue() * p1.getTeamName().compareTo(p2.getTeamName());
        }
        return 0;
    }
}
