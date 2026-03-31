package com.blank.bm15.dao.utils;

import java.lang.reflect.Field;
import java.util.Comparator;

/* loaded from: classes.dex */
public class BlankOrderFieldsByName implements Comparator<Field> {
    @Override // java.util.Comparator
    public int compare(Field obj1, Field obj2) {
        return obj1.getName().compareTo(obj2.getName());
    }
}
