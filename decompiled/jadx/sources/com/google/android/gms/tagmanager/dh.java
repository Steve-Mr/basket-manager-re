package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.d;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

/* JADX INFO: loaded from: classes.dex */
class dh {
    private static final Object aaF = null;
    private static Long aaG = new Long(0);
    private static Double aaH = new Double(0.0d);
    private static dg aaI = dg.w(0);
    private static String aaJ = new String("");
    private static Boolean aaK = new Boolean(false);
    private static List<Object> aaL = new ArrayList(0);
    private static Map<Object, Object> aaM = new HashMap();
    private static d.a aaN = r(aaJ);

    public static d.a bX(String str) {
        d.a aVar = new d.a();
        aVar.type = 5;
        aVar.fS = str;
        return aVar;
    }

    private static dg bY(String str) {
        try {
            return dg.bW(str);
        } catch (NumberFormatException e) {
            bh.w("Failed to convert '" + str + "' to a number.");
            return aaI;
        }
    }

    private static Long bZ(String str) {
        dg dgVarBY = bY(str);
        return dgVarBY == aaI ? aaG : Long.valueOf(dgVarBY.longValue());
    }

    private static Double ca(String str) {
        dg dgVarBY = bY(str);
        return dgVarBY == aaI ? aaH : Double.valueOf(dgVarBY.doubleValue());
    }

    private static Boolean cb(String str) {
        return "true".equalsIgnoreCase(str) ? Boolean.TRUE : "false".equalsIgnoreCase(str) ? Boolean.FALSE : aaK;
    }

    private static double getDouble(Object o) {
        if (o instanceof Number) {
            return ((Number) o).doubleValue();
        }
        bh.w("getDouble received non-Number");
        return 0.0d;
    }

    public static String j(d.a aVar) {
        return m(o(aVar));
    }

    public static dg k(d.a aVar) {
        return n(o(aVar));
    }

    public static Long l(d.a aVar) {
        return o(o(aVar));
    }

    public static Object lN() {
        return aaF;
    }

    public static Long lO() {
        return aaG;
    }

    public static Double lP() {
        return aaH;
    }

    public static Boolean lQ() {
        return aaK;
    }

    public static dg lR() {
        return aaI;
    }

    public static String lS() {
        return aaJ;
    }

    public static d.a lT() {
        return aaN;
    }

    public static Double m(d.a aVar) {
        return p(o(aVar));
    }

    public static String m(Object obj) {
        return obj == null ? aaJ : obj.toString();
    }

    public static dg n(Object obj) {
        return obj instanceof dg ? (dg) obj : t(obj) ? dg.w(u(obj)) : s(obj) ? dg.a(Double.valueOf(getDouble(obj))) : bY(m(obj));
    }

    public static Boolean n(d.a aVar) {
        return q(o(aVar));
    }

    public static Long o(Object obj) {
        return t(obj) ? Long.valueOf(u(obj)) : bZ(m(obj));
    }

    public static Object o(d.a aVar) {
        int i = 0;
        if (aVar == null) {
            return aaF;
        }
        switch (aVar.type) {
            case 1:
                break;
            case 2:
                ArrayList arrayList = new ArrayList(aVar.fO.length);
                d.a[] aVarArr = aVar.fO;
                int length = aVarArr.length;
                while (i < length) {
                    Object objO = o(aVarArr[i]);
                    if (objO != aaF) {
                        arrayList.add(objO);
                        i++;
                    }
                    break;
                }
                break;
            case 3:
                if (aVar.fP.length == aVar.fQ.length) {
                    HashMap map = new HashMap(aVar.fQ.length);
                    while (i < aVar.fP.length) {
                        Object objO2 = o(aVar.fP[i]);
                        Object objO3 = o(aVar.fQ[i]);
                        if (objO2 != aaF && objO3 != aaF) {
                            map.put(objO2, objO3);
                            i++;
                        }
                    }
                } else {
                    bh.w("Converting an invalid value to object: " + aVar.toString());
                }
                break;
            case 4:
                bh.w("Trying to convert a macro reference to object");
                break;
            case 5:
                bh.w("Trying to convert a function id to object");
                break;
            case 6:
                break;
            case 7:
                StringBuffer stringBuffer = new StringBuffer();
                d.a[] aVarArr2 = aVar.fV;
                int length2 = aVarArr2.length;
                while (i < length2) {
                    String strJ = j(aVarArr2[i]);
                    if (strJ != aaJ) {
                        stringBuffer.append(strJ);
                        i++;
                    }
                    break;
                }
                break;
            case 8:
                break;
            default:
                bh.w("Failed to convert a value of type: " + aVar.type);
                break;
        }
        return aaF;
    }

    public static Double p(Object obj) {
        return s(obj) ? Double.valueOf(getDouble(obj)) : ca(m(obj));
    }

    public static Boolean q(Object obj) {
        return obj instanceof Boolean ? (Boolean) obj : cb(m(obj));
    }

    public static d.a r(Object obj) {
        boolean z = false;
        d.a aVar = new d.a();
        if (obj instanceof d.a) {
            return (d.a) obj;
        }
        if (obj instanceof String) {
            aVar.type = 1;
            aVar.fN = (String) obj;
        } else if (obj instanceof List) {
            aVar.type = 2;
            List list = (List) obj;
            ArrayList arrayList = new ArrayList(list.size());
            Iterator it = list.iterator();
            boolean z2 = false;
            while (it.hasNext()) {
                d.a aVarR = r(it.next());
                if (aVarR == aaN) {
                    return aaN;
                }
                boolean z3 = z2 || aVarR.fX;
                arrayList.add(aVarR);
                z2 = z3;
            }
            aVar.fO = (d.a[]) arrayList.toArray(new d.a[0]);
            z = z2;
        } else if (obj instanceof Map) {
            aVar.type = 3;
            Set<Map.Entry> setEntrySet = ((Map) obj).entrySet();
            ArrayList arrayList2 = new ArrayList(setEntrySet.size());
            ArrayList arrayList3 = new ArrayList(setEntrySet.size());
            boolean z4 = false;
            for (Map.Entry entry : setEntrySet) {
                d.a aVarR2 = r(entry.getKey());
                d.a aVarR3 = r(entry.getValue());
                if (aVarR2 == aaN || aVarR3 == aaN) {
                    return aaN;
                }
                boolean z5 = z4 || aVarR2.fX || aVarR3.fX;
                arrayList2.add(aVarR2);
                arrayList3.add(aVarR3);
                z4 = z5;
            }
            aVar.fP = (d.a[]) arrayList2.toArray(new d.a[0]);
            aVar.fQ = (d.a[]) arrayList3.toArray(new d.a[0]);
            z = z4;
        } else if (s(obj)) {
            aVar.type = 1;
            aVar.fN = obj.toString();
        } else if (t(obj)) {
            aVar.type = 6;
            aVar.fT = u(obj);
        } else {
            if (!(obj instanceof Boolean)) {
                bh.w("Converting to Value from unknown object type: " + (obj == null ? "null" : obj.getClass().toString()));
                return aaN;
            }
            aVar.type = 8;
            aVar.fU = ((Boolean) obj).booleanValue();
        }
        aVar.fX = z;
        return aVar;
    }

    private static boolean s(Object obj) {
        return (obj instanceof Double) || (obj instanceof Float) || ((obj instanceof dg) && ((dg) obj).lI());
    }

    private static boolean t(Object obj) {
        return (obj instanceof Byte) || (obj instanceof Short) || (obj instanceof Integer) || (obj instanceof Long) || ((obj instanceof dg) && ((dg) obj).lJ());
    }

    private static long u(Object obj) {
        if (obj instanceof Number) {
            return ((Number) obj).longValue();
        }
        bh.w("getInt64 received non-Number");
        return 0L;
    }
}
