package com.google.android.gms.analytics;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.database.sqlite.SQLiteOpenHelper;
import android.os.Build;
import android.text.TextUtils;
import com.google.android.gms.internal.ef;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.apache.http.impl.client.DefaultHttpClient;

/* JADX INFO: loaded from: classes.dex */
class ac implements d {
    private static final String vx = String.format("CREATE TABLE IF NOT EXISTS %s ( '%s' INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, '%s' INTEGER NOT NULL, '%s' TEXT NOT NULL, '%s' TEXT NOT NULL, '%s' INTEGER);", "hits2", "hit_id", "hit_time", "hit_url", "hit_string", "hit_app_id");
    private final Context mContext;
    private final e sO;
    private i tg;
    private final String vA;
    private ab vB;
    private long vC;
    private final int vD;
    private final a vy;
    private volatile n vz;

    class a extends SQLiteOpenHelper {
        private boolean vF;
        private long vG;

        a(Context context, String str) {
            super(context, str, (SQLiteDatabase.CursorFactory) null, 1);
            this.vG = 0L;
        }

        private void a(SQLiteDatabase sQLiteDatabase) {
            Cursor cursorRawQuery = sQLiteDatabase.rawQuery("SELECT * FROM hits2 WHERE 0", null);
            HashSet hashSet = new HashSet();
            try {
                for (String str : cursorRawQuery.getColumnNames()) {
                    hashSet.add(str);
                }
                cursorRawQuery.close();
                if (!hashSet.remove("hit_id") || !hashSet.remove("hit_url") || !hashSet.remove("hit_string") || !hashSet.remove("hit_time")) {
                    throw new SQLiteException("Database column missing");
                }
                boolean z = hashSet.remove("hit_app_id") ? false : true;
                if (!hashSet.isEmpty()) {
                    throw new SQLiteException("Database has extra columns");
                }
                if (z) {
                    sQLiteDatabase.execSQL("ALTER TABLE hits2 ADD COLUMN hit_app_id");
                }
            } catch (Throwable th) {
                cursorRawQuery.close();
                throw th;
            }
        }

        /* JADX WARN: Removed duplicated region for block: B:16:0x0048  */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        private boolean a(java.lang.String r11, android.database.sqlite.SQLiteDatabase r12) throws java.lang.Throwable {
            /*
                r10 = this;
                r8 = 0
                r9 = 0
                java.lang.String r1 = "SQLITE_MASTER"
                r0 = 1
                java.lang.String[] r2 = new java.lang.String[r0]     // Catch: android.database.sqlite.SQLiteException -> L26 java.lang.Throwable -> L45
                r0 = 0
                java.lang.String r3 = "name"
                r2[r0] = r3     // Catch: android.database.sqlite.SQLiteException -> L26 java.lang.Throwable -> L45
                java.lang.String r3 = "name=?"
                r0 = 1
                java.lang.String[] r4 = new java.lang.String[r0]     // Catch: android.database.sqlite.SQLiteException -> L26 java.lang.Throwable -> L45
                r0 = 0
                r4[r0] = r11     // Catch: android.database.sqlite.SQLiteException -> L26 java.lang.Throwable -> L45
                r5 = 0
                r6 = 0
                r7 = 0
                r0 = r12
                android.database.Cursor r1 = r0.query(r1, r2, r3, r4, r5, r6, r7)     // Catch: android.database.sqlite.SQLiteException -> L26 java.lang.Throwable -> L45
                boolean r0 = r1.moveToFirst()     // Catch: java.lang.Throwable -> L4c android.database.sqlite.SQLiteException -> L53
                if (r1 == 0) goto L25
                r1.close()
            L25:
                return r0
            L26:
                r0 = move-exception
                r0 = r9
            L28:
                java.lang.StringBuilder r1 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> L4f
                r1.<init>()     // Catch: java.lang.Throwable -> L4f
                java.lang.String r2 = "Error querying for table "
                java.lang.StringBuilder r1 = r1.append(r2)     // Catch: java.lang.Throwable -> L4f
                java.lang.StringBuilder r1 = r1.append(r11)     // Catch: java.lang.Throwable -> L4f
                java.lang.String r1 = r1.toString()     // Catch: java.lang.Throwable -> L4f
                com.google.android.gms.analytics.aa.z(r1)     // Catch: java.lang.Throwable -> L4f
                if (r0 == 0) goto L43
                r0.close()
            L43:
                r0 = r8
                goto L25
            L45:
                r0 = move-exception
            L46:
                if (r9 == 0) goto L4b
                r9.close()
            L4b:
                throw r0
            L4c:
                r0 = move-exception
                r9 = r1
                goto L46
            L4f:
                r1 = move-exception
                r9 = r0
                r0 = r1
                goto L46
            L53:
                r0 = move-exception
                r0 = r1
                goto L28
            */
            throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.analytics.ac.a.a(java.lang.String, android.database.sqlite.SQLiteDatabase):boolean");
        }

        @Override // android.database.sqlite.SQLiteOpenHelper
        public SQLiteDatabase getWritableDatabase() {
            if (this.vF && this.vG + 3600000 > ac.this.tg.currentTimeMillis()) {
                throw new SQLiteException("Database creation failed");
            }
            SQLiteDatabase writableDatabase = null;
            this.vF = true;
            this.vG = ac.this.tg.currentTimeMillis();
            try {
                writableDatabase = super.getWritableDatabase();
            } catch (SQLiteException e) {
                ac.this.mContext.getDatabasePath(ac.this.vA).delete();
            }
            if (writableDatabase == null) {
                writableDatabase = super.getWritableDatabase();
            }
            this.vF = false;
            return writableDatabase;
        }

        @Override // android.database.sqlite.SQLiteOpenHelper
        public void onCreate(SQLiteDatabase db) {
            p.G(db.getPath());
        }

        @Override // android.database.sqlite.SQLiteOpenHelper
        public void onOpen(SQLiteDatabase db) {
            if (Build.VERSION.SDK_INT < 15) {
                Cursor cursorRawQuery = db.rawQuery("PRAGMA journal_mode=memory", null);
                try {
                    cursorRawQuery.moveToFirst();
                } finally {
                    cursorRawQuery.close();
                }
            }
            if (a("hits2", db)) {
                a(db);
            } else {
                db.execSQL(ac.vx);
            }
        }

        @Override // android.database.sqlite.SQLiteOpenHelper
        public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        }
    }

    ac(e eVar, Context context) {
        this(eVar, context, "google_analytics_v4.db", 2000);
    }

    ac(e eVar, Context context, String str, int i) {
        this.mContext = context.getApplicationContext();
        this.vA = str;
        this.sO = eVar;
        this.tg = new i() { // from class: com.google.android.gms.analytics.ac.1
            @Override // com.google.android.gms.analytics.i
            public long currentTimeMillis() {
                return System.currentTimeMillis();
            }
        };
        this.vy = new a(this.mContext, this.vA);
        this.vz = new ah(new DefaultHttpClient(), this.mContext);
        this.vC = 0L;
        this.vD = i;
    }

    private SQLiteDatabase L(String str) {
        try {
            return this.vy.getWritableDatabase();
        } catch (SQLiteException e) {
            aa.z(str);
            return null;
        }
    }

    private void a(Map<String, String> map, long j, String str) {
        long j2;
        SQLiteDatabase sQLiteDatabaseL = L("Error opening database for putHit");
        if (sQLiteDatabaseL == null) {
            return;
        }
        ContentValues contentValues = new ContentValues();
        contentValues.put("hit_string", w(map));
        contentValues.put("hit_time", Long.valueOf(j));
        if (map.containsKey("AppUID")) {
            try {
                j2 = Long.parseLong(map.get("AppUID"));
            } catch (NumberFormatException e) {
                j2 = 0;
            }
        } else {
            j2 = 0;
        }
        contentValues.put("hit_app_id", Long.valueOf(j2));
        if (str == null) {
            str = "http://www.google-analytics.com/collect";
        }
        if (str.length() == 0) {
            aa.z("Empty path: not sending hit");
            return;
        }
        contentValues.put("hit_url", str);
        try {
            sQLiteDatabaseL.insert("hits2", null, contentValues);
            this.sO.r(false);
        } catch (SQLiteException e2) {
            aa.z("Error storing hit");
        }
    }

    private void a(Map<String, String> map, Collection<ef> collection) {
        String strSubstring = "&_v".substring(1);
        if (collection != null) {
            for (ef efVar : collection) {
                if ("appendVersion".equals(efVar.getId())) {
                    map.put(strSubstring, efVar.getValue());
                    return;
                }
            }
        }
    }

    private void cV() throws Throwable {
        int iCX = (cX() - this.vD) + 1;
        if (iCX > 0) {
            List<String> listS = s(iCX);
            aa.y("Store full, deleting " + listS.size() + " hits to make room.");
            a((String[]) listS.toArray(new String[0]));
        }
    }

    static String w(Map<String, String> map) {
        ArrayList arrayList = new ArrayList(map.size());
        for (Map.Entry<String, String> entry : map.entrySet()) {
            arrayList.add(y.encode(entry.getKey()) + "=" + y.encode(entry.getValue()));
        }
        return TextUtils.join("&", arrayList);
    }

    @Override // com.google.android.gms.analytics.d
    public void a(Map<String, String> map, long j, String str, Collection<ef> collection) throws Throwable {
        cW();
        cV();
        a(map, collection);
        a(map, j, str);
    }

    void a(String[] strArr) {
        if (strArr == null || strArr.length == 0) {
            aa.z("Empty hitIds passed to deleteHits.");
            return;
        }
        SQLiteDatabase sQLiteDatabaseL = L("Error opening database for deleteHits.");
        if (sQLiteDatabaseL != null) {
            try {
                sQLiteDatabaseL.delete("hits2", String.format("HIT_ID in (%s)", TextUtils.join(",", Collections.nCopies(strArr.length, "?"))), strArr);
                this.sO.r(cX() == 0);
            } catch (SQLiteException e) {
                aa.z("Error deleting hits " + strArr);
            }
        }
    }

    @Deprecated
    void b(Collection<x> collection) {
        if (collection == null || collection.isEmpty()) {
            aa.z("Empty/Null collection passed to deleteHits.");
            return;
        }
        String[] strArr = new String[collection.size()];
        Iterator<x> it = collection.iterator();
        int i = 0;
        while (it.hasNext()) {
            strArr[i] = String.valueOf(it.next().cP());
            i++;
        }
        a(strArr);
    }

    @Override // com.google.android.gms.analytics.d
    public void bW() throws Throwable {
        aa.y("Dispatch running...");
        if (this.vz.ch()) {
            List<x> listT = t(40);
            if (listT.isEmpty()) {
                aa.y("...nothing to dispatch");
                this.sO.r(true);
                return;
            }
            if (this.vB == null) {
                this.vB = new ab("_t=dispatch&_v=ma4.0.1", true);
            }
            int iA = this.vz.a(listT, this.vB, cX() <= listT.size());
            aa.y("sent " + iA + " of " + listT.size() + " hits");
            b(listT.subList(0, Math.min(iA, listT.size())));
            if (iA != listT.size() || cX() <= 0) {
                this.vB = null;
            } else {
                GoogleAnalytics.getInstance(this.mContext).dispatchLocalHits();
            }
        }
    }

    @Override // com.google.android.gms.analytics.d
    public n bX() {
        return this.vz;
    }

    int cW() {
        long jCurrentTimeMillis = this.tg.currentTimeMillis();
        if (jCurrentTimeMillis <= this.vC + 86400000) {
            return 0;
        }
        this.vC = jCurrentTimeMillis;
        SQLiteDatabase sQLiteDatabaseL = L("Error opening database for deleteStaleHits.");
        if (sQLiteDatabaseL == null) {
            return 0;
        }
        int iDelete = sQLiteDatabaseL.delete("hits2", "HIT_TIME < ?", new String[]{Long.toString(this.tg.currentTimeMillis() - 2592000000L)});
        this.sO.r(cX() == 0);
        return iDelete;
    }

    int cX() {
        Cursor cursorRawQuery = null;
        SQLiteDatabase sQLiteDatabaseL = L("Error opening database for getNumStoredHits.");
        try {
            if (sQLiteDatabaseL != null) {
                try {
                    cursorRawQuery = sQLiteDatabaseL.rawQuery("SELECT COUNT(*) from hits2", null);
                    i = cursorRawQuery.moveToFirst() ? (int) cursorRawQuery.getLong(0) : 0;
                    if (cursorRawQuery != null) {
                        cursorRawQuery.close();
                    }
                } catch (SQLiteException e) {
                    aa.z("Error getting numStoredHits");
                    if (cursorRawQuery != null) {
                        cursorRawQuery.close();
                    }
                }
            }
            return i;
        } catch (Throwable th) {
            if (cursorRawQuery != null) {
                cursorRawQuery.close();
            }
            throw th;
        }
    }

    @Override // com.google.android.gms.analytics.d
    public void j(long j) {
        SQLiteDatabase sQLiteDatabaseL = L("Error opening database for clearHits");
        if (sQLiteDatabaseL != null) {
            if (j == 0) {
                sQLiteDatabaseL.delete("hits2", null, null);
            } else {
                sQLiteDatabaseL.delete("hits2", "hit_app_id = ?", new String[]{Long.valueOf(j).toString()});
            }
            this.sO.r(cX() == 0);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x0082  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    java.util.List<java.lang.String> s(int r14) throws java.lang.Throwable {
        /*
            r13 = this;
            r10 = 0
            java.util.ArrayList r9 = new java.util.ArrayList
            r9.<init>()
            if (r14 > 0) goto Lf
            java.lang.String r0 = "Invalid maxHits specified. Skipping"
            com.google.android.gms.analytics.aa.z(r0)
            r0 = r9
        Le:
            return r0
        Lf:
            java.lang.String r0 = "Error opening database for peekHitIds."
            android.database.sqlite.SQLiteDatabase r0 = r13.L(r0)
            if (r0 != 0) goto L19
            r0 = r9
            goto Le
        L19:
            java.lang.String r1 = "hits2"
            r2 = 1
            java.lang.String[] r2 = new java.lang.String[r2]     // Catch: android.database.sqlite.SQLiteException -> L5c java.lang.Throwable -> L7e
            r3 = 0
            java.lang.String r4 = "hit_id"
            r2[r3] = r4     // Catch: android.database.sqlite.SQLiteException -> L5c java.lang.Throwable -> L7e
            r3 = 0
            r4 = 0
            r5 = 0
            r6 = 0
            java.lang.String r7 = "%s ASC"
            r8 = 1
            java.lang.Object[] r8 = new java.lang.Object[r8]     // Catch: android.database.sqlite.SQLiteException -> L5c java.lang.Throwable -> L7e
            r11 = 0
            java.lang.String r12 = "hit_id"
            r8[r11] = r12     // Catch: android.database.sqlite.SQLiteException -> L5c java.lang.Throwable -> L7e
            java.lang.String r7 = java.lang.String.format(r7, r8)     // Catch: android.database.sqlite.SQLiteException -> L5c java.lang.Throwable -> L7e
            java.lang.String r8 = java.lang.Integer.toString(r14)     // Catch: android.database.sqlite.SQLiteException -> L5c java.lang.Throwable -> L7e
            android.database.Cursor r1 = r0.query(r1, r2, r3, r4, r5, r6, r7, r8)     // Catch: android.database.sqlite.SQLiteException -> L5c java.lang.Throwable -> L7e
            boolean r0 = r1.moveToFirst()     // Catch: java.lang.Throwable -> L86 android.database.sqlite.SQLiteException -> L88
            if (r0 == 0) goto L55
        L43:
            r0 = 0
            long r2 = r1.getLong(r0)     // Catch: java.lang.Throwable -> L86 android.database.sqlite.SQLiteException -> L88
            java.lang.String r0 = java.lang.String.valueOf(r2)     // Catch: java.lang.Throwable -> L86 android.database.sqlite.SQLiteException -> L88
            r9.add(r0)     // Catch: java.lang.Throwable -> L86 android.database.sqlite.SQLiteException -> L88
            boolean r0 = r1.moveToNext()     // Catch: java.lang.Throwable -> L86 android.database.sqlite.SQLiteException -> L88
            if (r0 != 0) goto L43
        L55:
            if (r1 == 0) goto L5a
            r1.close()
        L5a:
            r0 = r9
            goto Le
        L5c:
            r0 = move-exception
            r1 = r10
        L5e:
            java.lang.StringBuilder r2 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> L86
            r2.<init>()     // Catch: java.lang.Throwable -> L86
            java.lang.String r3 = "Error in peekHits fetching hitIds: "
            java.lang.StringBuilder r2 = r2.append(r3)     // Catch: java.lang.Throwable -> L86
            java.lang.String r0 = r0.getMessage()     // Catch: java.lang.Throwable -> L86
            java.lang.StringBuilder r0 = r2.append(r0)     // Catch: java.lang.Throwable -> L86
            java.lang.String r0 = r0.toString()     // Catch: java.lang.Throwable -> L86
            com.google.android.gms.analytics.aa.z(r0)     // Catch: java.lang.Throwable -> L86
            if (r1 == 0) goto L5a
            r1.close()
            goto L5a
        L7e:
            r0 = move-exception
            r1 = r10
        L80:
            if (r1 == 0) goto L85
            r1.close()
        L85:
            throw r0
        L86:
            r0 = move-exception
            goto L80
        L88:
            r0 = move-exception
            goto L5e
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.analytics.ac.s(int):java.util.List");
    }

    /* JADX WARN: Removed duplicated region for block: B:35:0x00fc  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.util.List<com.google.android.gms.analytics.x> t(int r17) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 394
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.analytics.ac.t(int):java.util.List");
    }
}
