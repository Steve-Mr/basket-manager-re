package com.blank.bm15.model.comparator;

import com.blank.bm15.model.object.crud.DraftRound;
import com.blank.bm15.model.object.crud.Player;
import java.util.Comparator;

/* loaded from: classes.dex */
public class PlayerOrDraftRoundComparator implements Comparator<Object> {
    public static final int ORDER_BY_MARKET_VALUE = 0;
    public static final int ORDER_TYPE_ASC = 1;
    public static final int ORDER_TYPE_DESC = -1;
    private Integer orderBy;
    private Integer orderType;

    public PlayerOrDraftRoundComparator(int orderBy, int orderType) {
        this.orderBy = Integer.valueOf(orderBy);
        this.orderType = Integer.valueOf(orderType);
    }

    @Override // java.util.Comparator
    public int compare(Object p1, Object p2) {
        Double value1;
        Double value2;
        Double.valueOf(0.0d);
        Double.valueOf(0.0d);
        if (p1 instanceof Player) {
            value1 = Double.valueOf(((Player) p1).getMarketValue());
        } else {
            value1 = ((DraftRound) p1).getMarketValue();
        }
        if (p2 instanceof Player) {
            value2 = Double.valueOf(((Player) p2).getMarketValue());
        } else {
            value2 = ((DraftRound) p2).getMarketValue();
        }
        if (this.orderBy.intValue() == 0) {
            return this.orderType.intValue() * value1.compareTo(value2);
        }
        return 0;
    }
}
