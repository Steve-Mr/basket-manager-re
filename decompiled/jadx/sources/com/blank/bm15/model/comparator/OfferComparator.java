package com.blank.bm15.model.comparator;

import com.blank.bm15.model.object.crud.Offer;
import com.blank.bm15.model.util.Constant;
import java.util.Comparator;

/* JADX INFO: loaded from: classes.dex */
public class OfferComparator implements Comparator<Offer> {
    public static final int ORDER_BY_SALARY = 0;
    public static final int ORDER_TYPE_DESC = -1;
    private Integer orderBy;
    private Integer orderType;

    public OfferComparator(int orderBy, int orderType) {
        this.orderBy = Integer.valueOf(orderBy);
        this.orderType = Integer.valueOf(orderType);
    }

    @Override // java.util.Comparator
    public int compare(Offer p1, Offer p2) {
        Integer salary1 = p1.getSalary();
        Integer salary2 = p2.getSalary();
        int percent1 = (p1.getTeam().getSalaryCap().intValue() / Constant.SALARY_CAP_PLUS.intValue()) - (Constant.SALARY_CAP_MED.intValue() / Constant.SALARY_CAP_PLUS.intValue());
        int percent2 = (p2.getTeam().getSalaryCap().intValue() / Constant.SALARY_CAP_PLUS.intValue()) - (Constant.SALARY_CAP_MED.intValue() / Constant.SALARY_CAP_PLUS.intValue());
        Integer salary12 = Integer.valueOf(salary1.intValue() + ((salary1.intValue() * percent1) / 100));
        Integer salary22 = Integer.valueOf(salary2.intValue() + ((salary2.intValue() * percent2) / 100));
        if (this.orderBy.intValue() == 0) {
            return this.orderType.intValue() * salary12.compareTo(salary22);
        }
        return 0;
    }
}
