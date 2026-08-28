package com.google.android.gms.tagmanager;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.database.sqlite.SQLiteOpenHelper;
import android.os.Build;
import android.text.TextUtils;
import com.google.android.gms.internal.gl;
import com.google.android.gms.internal.gn;
import com.google.android.gms.tagmanager.da;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import org.apache.http.impl.client.DefaultHttpClient;

/* JADX INFO: loaded from: classes.dex */
class ca implements at {
    private static final String vx = String.format("CREATE TABLE IF NOT EXISTS %s ( '%s' INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, '%s' INTEGER NOT NULL, '%s' TEXT NOT NULL,'%s' INTEGER NOT NULL);", "gtm_hits", "hit_id", "hit_time", "hit_url", "hit_first_send_time");
    private gl Wv;
    private final b YI;
    private volatile ab YJ;
    private final au YK;
    private final Context mContext;
    private final String vA;
    private long vC;
    private final int vD;

    class a implements da.a {
        a() {
        }

        @Override // com.google.android.gms.tagmanager.da.a
        public void a(ap apVar) {
            ca.this.v(apVar.cP());
        }

        @Override // com.google.android.gms.tagmanager.da.a
        public void b(ap apVar) {
            ca.this.v(apVar.cP());
            bh.y("Permanent failure dispatching hitId: " + apVar.cP());
        }

        @Override // com.google.android.gms.tagmanager.da.a
        public void c(ap apVar) {
            long jKD = apVar.kD();
            if (jKD == 0) {
                ca.this.c(apVar.cP(), ca.this.Wv.currentTimeMillis());
            } else if (jKD + 14400000 < ca.this.Wv.currentTimeMillis()) {
                ca.this.v(apVar.cP());
                bh.y("Giving up on failed hitId: " + apVar.cP());
            }
        }
    }

    class b extends SQLiteOpenHelper {
        private boolean vF;
        private long vG;

        b(Context context, String str) {
            super(context, str, (SQLiteDatabase.CursorFactory) null, 1);
            this.vG = 0L;
        }

        private void a(SQLiteDatabase sQLiteDatabase) {
            Cursor cursorRawQuery = sQLiteDatabase.rawQuery("SELECT * FROM gtm_hits WHERE 0", null);
            HashSet hashSet = new HashSet();
            try {
                for (String str : cursorRawQuery.getColumnNames()) {
                    hashSet.add(str);
                }
                cursorRawQuery.close();
                if (!hashSet.remove("hit_id") || !hashSet.remove("hit_url") || !hashSet.remove("hit_time") || !hashSet.remove("hit_first_send_time")) {
                    throw new SQLiteException("Database column missing");
                }
                if (!hashSet.isEmpty()) {
                    throw new SQLiteException("Database has extra columns");
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
                com.google.android.gms.tagmanager.bh.z(r1)     // Catch: java.lang.Throwable -> L4f
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
            throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.tagmanager.ca.b.a(java.lang.String, android.database.sqlite.SQLiteDatabase):boolean");
        }

        @Override // android.database.sqlite.SQLiteOpenHelper
        public SQLiteDatabase getWritableDatabase() {
            if (this.vF && this.vG + 3600000 > ca.this.Wv.currentTimeMillis()) {
                throw new SQLiteException("Database creation failed");
            }
            SQLiteDatabase writableDatabase = null;
            this.vF = true;
            this.vG = ca.this.Wv.currentTimeMillis();
            try {
                writableDatabase = super.getWritableDatabase();
            } catch (SQLiteException e) {
                ca.this.mContext.getDatabasePath(ca.this.vA).delete();
            }
            if (writableDatabase == null) {
                writableDatabase = super.getWritableDatabase();
            }
            this.vF = false;
            return writableDatabase;
        }

        @Override // android.database.sqlite.SQLiteOpenHelper
        public void onCreate(SQLiteDatabase db) {
            ak.G(db.getPath());
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
            if (a("gtm_hits", db)) {
                a(db);
            } else {
                db.execSQL(ca.vx);
            }
        }

        @Override // android.database.sqlite.SQLiteOpenHelper
        public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        }
    }

    ca(au auVar, Context context) {
        this(auVar, context, "gtm_urls.db", 2000);
    }

    ca(au auVar, Context context, String str, int i) {
        this.mContext = context.getApplicationContext();
        this.vA = str;
        this.YK = auVar;
        this.Wv = gn.ft();
        this.YI = new b(this.mContext, this.vA);
        this.YJ = new da(new DefaultHttpClient(), this.mContext, new a());
        this.vC = 0L;
        this.vD = i;
    }

    private SQLiteDatabase L(String str) {
        try {
            return this.YI.getWritableDatabase();
        } catch (SQLiteException e) {
            bh.z(str);
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void c(long j, long j2) {
        SQLiteDatabase sQLiteDatabaseL = L("Error opening database for getNumStoredHits.");
        if (sQLiteDatabaseL == null) {
            return;
        }
        ContentValues contentValues = new ContentValues();
        contentValues.put("hit_first_send_time", Long.valueOf(j2));
        try {
            sQLiteDatabaseL.update("gtm_hits", contentValues, "hit_id=?", new String[]{String.valueOf(j)});
        } catch (SQLiteException e) {
            bh.z("Error setting HIT_FIRST_DISPATCH_TIME for hitId: " + j);
            v(j);
        }
    }

    private void cV() throws Throwable {
        int iCX = (cX() - this.vD) + 1;
        if (iCX > 0) {
            List<String> listS = s(iCX);
            bh.y("Store full, deleting " + listS.size() + " hits to make room.");
            a((String[]) listS.toArray(new String[0]));
        }
    }

    private void f(long j, String str) {
        SQLiteDatabase sQLiteDatabaseL = L("Error opening database for putHit");
        if (sQLiteDatabaseL == null) {
            return;
        }
        ContentValues contentValues = new ContentValues();
        contentValues.put("hit_time", Long.valueOf(j));
        contentValues.put("hit_url", str);
        contentValues.put("hit_first_send_time", (Integer) 0);
        try {
            sQLiteDatabaseL.insert("gtm_hits", null, contentValues);
            this.YK.r(false);
        } catch (SQLiteException e) {
            bh.z("Error storing hit");
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void v(long j) {
        a(new String[]{String.valueOf(j)});
    }

    void a(String[] strArr) {
        SQLiteDatabase sQLiteDatabaseL;
        if (strArr == null || strArr.length == 0 || (sQLiteDatabaseL = L("Error opening database for deleteHits.")) == null) {
            return;
        }
        try {
            sQLiteDatabaseL.delete("gtm_hits", String.format("HIT_ID in (%s)", TextUtils.join(",", Collections.nCopies(strArr.length, "?"))), strArr);
            this.YK.r(cX() == 0);
        } catch (SQLiteException e) {
            bh.z("Error deleting hits");
        }
    }

    @Override // com.google.android.gms.tagmanager.at
    public void bW() throws Throwable {
        bh.y("GTM Dispatch running...");
        if (this.YJ.ch()) {
            List<ap> listT = t(40);
            if (listT.isEmpty()) {
                bh.y("...nothing to dispatch");
                this.YK.r(true);
            } else {
                this.YJ.d(listT);
                if (kR() > 0) {
                    cx.lG().bW();
                }
            }
        }
    }

    int cW() {
        long jCurrentTimeMillis = this.Wv.currentTimeMillis();
        if (jCurrentTimeMillis <= this.vC + 86400000) {
            return 0;
        }
        this.vC = jCurrentTimeMillis;
        SQLiteDatabase sQLiteDatabaseL = L("Error opening database for deleteStaleHits.");
        if (sQLiteDatabaseL == null) {
            return 0;
        }
        int iDelete = sQLiteDatabaseL.delete("gtm_hits", "HIT_TIME < ?", new String[]{Long.toString(this.Wv.currentTimeMillis() - 2592000000L)});
        this.YK.r(cX() == 0);
        return iDelete;
    }

    int cX() {
        Cursor cursorRawQuery = null;
        SQLiteDatabase sQLiteDatabaseL = L("Error opening database for getNumStoredHits.");
        try {
            if (sQLiteDatabaseL != null) {
                try {
                    cursorRawQuery = sQLiteDatabaseL.rawQuery("SELECT COUNT(*) from gtm_hits", null);
                    i = cursorRawQuery.moveToFirst() ? (int) cursorRawQuery.getLong(0) : 0;
                    if (cursorRawQuery != null) {
                        cursorRawQuery.close();
                    }
                } catch (SQLiteException e) {
                    bh.z("Error getting numStoredHits");
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

    @Override // com.google.android.gms.tagmanager.at
    public void e(long j, String str) throws Throwable {
        cW();
        cV();
        f(j, str);
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0040  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    int kR() throws java.lang.Throwable {
        /*
            r10 = this;
            r8 = 0
            r9 = 0
            java.lang.String r0 = "Error opening database for getNumStoredHits."
            android.database.sqlite.SQLiteDatabase r0 = r10.L(r0)
            if (r0 != 0) goto Lb
        La:
            return r8
        Lb:
            java.lang.String r1 = "gtm_hits"
            r2 = 2
            java.lang.String[] r2 = new java.lang.String[r2]     // Catch: android.database.sqlite.SQLiteException -> L2f java.lang.Throwable -> L3d
            r3 = 0
            java.lang.String r4 = "hit_id"
            r2[r3] = r4     // Catch: android.database.sqlite.SQLiteException -> L2f java.lang.Throwable -> L3d
            r3 = 1
            java.lang.String r4 = "hit_first_send_time"
            r2[r3] = r4     // Catch: android.database.sqlite.SQLiteException -> L2f java.lang.Throwable -> L3d
            java.lang.String r3 = "hit_first_send_time=0"
            r4 = 0
            r5 = 0
            r6 = 0
            r7 = 0
            android.database.Cursor r1 = r0.query(r1, r2, r3, r4, r5, r6, r7)     // Catch: android.database.sqlite.SQLiteException -> L2f java.lang.Throwable -> L3d
            int r0 = r1.getCount()     // Catch: java.lang.Throwable -> L44 android.database.sqlite.SQLiteException -> L4b
            if (r1 == 0) goto L2d
            r1.close()
        L2d:
            r8 = r0
            goto La
        L2f:
            r0 = move-exception
            r0 = r9
        L31:
            java.lang.String r1 = "Error getting num untried hits"
            com.google.android.gms.tagmanager.bh.z(r1)     // Catch: java.lang.Throwable -> L47
            if (r0 == 0) goto L4e
            r0.close()
            r0 = r8
            goto L2d
        L3d:
            r0 = move-exception
        L3e:
            if (r9 == 0) goto L43
            r9.close()
        L43:
            throw r0
        L44:
            r0 = move-exception
            r9 = r1
            goto L3e
        L47:
            r1 = move-exception
            r9 = r0
            r0 = r1
            goto L3e
        L4b:
            r0 = move-exception
            r0 = r1
            goto L31
        L4e:
            r0 = r8
            goto L2d
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.tagmanager.ca.kR():int");
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
            com.google.android.gms.tagmanager.bh.z(r0)
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
            java.lang.String r1 = "gtm_hits"
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
            com.google.android.gms.tagmanager.bh.z(r0)     // Catch: java.lang.Throwable -> L86
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
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.tagmanager.ca.s(int):java.util.List");
    }

    /* JADX WARN: Removed duplicated region for block: B:35:0x00f2  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.util.List<com.google.android.gms.tagmanager.ap> t(int r17) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 384
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.tagmanager.ca.t(int):java.util.List");
    }
}
