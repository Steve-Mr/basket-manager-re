package com.blank.bm15.model.comparator;

import com.blank.bm15.model.object.crud.Team;
import java.util.Comparator;

/* loaded from: classes.dex */
public class TeamComparator implements Comparator<Team> {
    public static final int ORDER_BY_NAME = 1;
    public static final int ORDER_BY_VALUE = 0;
    public static final int ORDER_TYPE_ASC = 1;
    public static final int ORDER_TYPE_DESC = -1;
    private Integer orderBy;
    private Integer orderType;

    public TeamComparator(int orderBy, int orderType) {
        this.orderBy = Integer.valueOf(orderBy);
        this.orderType = Integer.valueOf(orderType);
    }

    @Override // java.util.Comparator
    public int compare(Team p1, Team p2) {
        if (this.orderBy.intValue() == 0) {
            return this.orderType.intValue() * p1.getTeamAverageValue().compareTo(p2.getTeamAverageValue());
        }
        if (this.orderBy.intValue() == 1) {
            return this.orderType.intValue() * p1.getName().compareTo(p2.getName());
        }
        return 0;
    }
}
