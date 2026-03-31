package com.blank.bm15.model.comparator;

import com.blank.bm15.model.object.crud.News;
import java.util.Comparator;

/* loaded from: classes.dex */
public class NewsComparator implements Comparator<News> {
    public static final int ORDER_BY_MATCHDAY = 0;
    public static final int ORDER_TYPE_ASC = 1;
    public static final int ORDER_TYPE_DESC = -1;
    private Integer orderBy;
    private Integer orderType;

    public NewsComparator(int orderBy, int orderType) {
        this.orderBy = Integer.valueOf(orderBy);
        this.orderType = Integer.valueOf(orderType);
    }

    @Override // java.util.Comparator
    public int compare(News p1, News p2) {
        if (this.orderBy.intValue() == 0) {
            return this.orderType.intValue() * p1.getMatchday().compareTo(p2.getMatchday());
        }
        return 0;
    }
}
