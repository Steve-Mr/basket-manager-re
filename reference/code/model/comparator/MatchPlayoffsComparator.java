package com.blank.bm15.model.comparator;

import com.blank.bm15.model.object.other.MatchPlayoffs;
import java.util.Comparator;

/* loaded from: classes.dex */
public class MatchPlayoffsComparator implements Comparator<MatchPlayoffs> {
    @Override // java.util.Comparator
    public int compare(MatchPlayoffs object1, MatchPlayoffs object2) {
        if (object1.getConference() == null || object2.getConference() == null) {
            return 0;
        }
        if (object1.getConference().intValue() < object2.getConference().intValue()) {
            return -1;
        }
        return object1.getConference().intValue() > object2.getConference().intValue() ? 1 : 0;
    }
}
