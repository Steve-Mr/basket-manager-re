package com.blank.bm15.model.comparator;

import com.blank.bm15.model.object.crud.Player;
import java.util.Comparator;

/* loaded from: classes.dex */
public class PlayerComparator implements Comparator<Player> {
    public static final int ORDER_BY_AGE = 5;
    public static final int ORDER_BY_AVERAGE_ALL = 1;
    public static final int ORDER_BY_AVERAGE_ATTACK = 2;
    public static final int ORDER_BY_AVERAGE_DEFENSE = 3;
    public static final int ORDER_BY_POSITION = 6;
    public static final int ORDER_BY_POTENTIAL = 4;
    public static final int ORDER_BY_VALUE = 0;
    public static final int ORDER_TYPE_ASC = 1;
    public static final int ORDER_TYPE_DESC = -1;
    private Integer orderBy;
    private Integer orderType;

    public PlayerComparator(int orderBy, int orderType) {
        this.orderBy = Integer.valueOf(orderBy);
        this.orderType = Integer.valueOf(orderType);
    }

    @Override // java.util.Comparator
    public int compare(Player p1, Player p2) {
        if (this.orderBy.intValue() == 0) {
            return this.orderType.intValue() * p1.getValue().compareTo(p2.getValue());
        }
        if (this.orderBy.intValue() == 1) {
            return this.orderType.intValue() * p1.getAverageSkillAll().compareTo(p2.getAverageSkillAll());
        }
        if (this.orderBy.intValue() == 2) {
            return this.orderType.intValue() * p1.getAverageSkillAttack().compareTo(p2.getAverageSkillAttack());
        }
        if (this.orderBy.intValue() == 3) {
            return this.orderType.intValue() * p1.getAverageSkillDefense().compareTo(p2.getAverageSkillDefense());
        }
        if (this.orderBy.intValue() == 4) {
            return this.orderType.intValue() * p1.getPotential().compareTo(p2.getPotential());
        }
        if (this.orderBy.intValue() == 5) {
            return this.orderType.intValue() * p1.getAge().compareTo(p2.getAge());
        }
        if (this.orderBy.intValue() == 6) {
            return p1.getPositionFirst().compareTo(p2.getPositionFirst());
        }
        return 0;
    }
}
