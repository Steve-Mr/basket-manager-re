package com.blank.bm15.model.comparator;

import com.blank.bm15.model.object.crud.Navigation;
import java.util.Comparator;

/* JADX INFO: loaded from: classes.dex */
public class NavigationComparator implements Comparator<Navigation> {
    @Override // java.util.Comparator
    public int compare(Navigation n1, Navigation n2) {
        return n1.getId().compareTo(n2.getId()) * (-1);
    }
}
