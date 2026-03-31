package com.blank.bm15.dao.utils;

/* loaded from: classes.dex */
public class BlankObj {
    public static String toString(Object obj) {
        if (obj == null) {
            return "";
        }
        if (obj instanceof Boolean) {
            return String.valueOf(((Boolean) obj).booleanValue() ? "1" : "0");
        }
        return obj.toString();
    }

    public static Integer toInteger(Object obj) {
        if (obj == null) {
            return null;
        }
        if (obj instanceof Boolean) {
            return Integer.valueOf(((Boolean) obj).booleanValue() ? 1 : 0);
        }
        if (obj instanceof Integer) {
            return (Integer) obj;
        }
        if (obj instanceof Long) {
            return Integer.valueOf(((Long) obj).intValue());
        }
        if (obj instanceof Float) {
            return Integer.valueOf(Float.valueOf(((Float) obj).floatValue() + 0.5f).intValue());
        }
        if (obj instanceof Double) {
            return Integer.valueOf(Double.valueOf(((Double) obj).doubleValue() + 0.5d).intValue());
        }
        try {
            return Integer.valueOf(obj.toString());
        } catch (NumberFormatException e) {
            return null;
        }
    }

    public static Long toLong(Object obj) {
        if (obj == null) {
            return null;
        }
        if (obj instanceof Boolean) {
            return Long.valueOf(((Boolean) obj).booleanValue() ? 1 : 0);
        }
        if (obj instanceof Integer) {
            return Long.valueOf(((Integer) obj).longValue());
        }
        if (obj instanceof Long) {
            return (Long) obj;
        }
        if (obj instanceof Float) {
            return Long.valueOf(Float.valueOf(((Float) obj).floatValue() + 0.5f).longValue());
        }
        if (obj instanceof Double) {
            return Long.valueOf(Double.valueOf(((Double) obj).doubleValue() + 0.5d).longValue());
        }
        try {
            return Long.valueOf(obj.toString());
        } catch (NumberFormatException e) {
            return null;
        }
    }

    public static Float toFloat(Object obj) {
        if (obj == null) {
            return null;
        }
        if (obj instanceof Boolean) {
            return Float.valueOf(((Boolean) obj).booleanValue() ? 1 : 0);
        }
        if (obj instanceof Integer) {
            return Float.valueOf(((Float) obj).floatValue());
        }
        if (obj instanceof Long) {
            return Float.valueOf(((Long) obj).floatValue());
        }
        if (obj instanceof Float) {
            return (Float) obj;
        }
        if (obj instanceof Double) {
            return Float.valueOf(((Double) obj).floatValue());
        }
        try {
            return Float.valueOf(obj.toString());
        } catch (NumberFormatException e) {
            return null;
        }
    }

    public static Double toDouble(Object obj) {
        if (obj == null) {
            return null;
        }
        if (obj instanceof Boolean) {
            return Double.valueOf(((Boolean) obj).booleanValue() ? 1 : 0);
        }
        if (obj instanceof Integer) {
            return Double.valueOf(obj.toString());
        }
        if (obj instanceof Long) {
            return Double.valueOf(((Long) obj).doubleValue());
        }
        if (obj instanceof Float) {
            return Double.valueOf(((Float) obj).doubleValue());
        }
        if (obj instanceof Double) {
            return (Double) obj;
        }
        try {
            return Double.valueOf(obj.toString());
        } catch (NumberFormatException e) {
            return null;
        }
    }

    public static Boolean toBoolean(Object obj) {
        if (obj == null) {
            return Boolean.FALSE;
        }
        if (obj instanceof Boolean) {
            return (Boolean) obj;
        }
        if (obj instanceof Integer) {
            return ((Integer) obj).intValue() == 1;
        }
        if (obj instanceof Long) {
            return ((Long) obj).intValue() == 1;
        }
        if (obj instanceof Float) {
            return ((Float) obj).intValue() == 1;
        }
        if (obj instanceof Double) {
            return ((Double) obj).intValue() == 1;
        }
        return Boolean.FALSE;
    }

    public static Boolean isNullOrEmpty(String text) {
        return text == null || "".equals(text);
    }
}
