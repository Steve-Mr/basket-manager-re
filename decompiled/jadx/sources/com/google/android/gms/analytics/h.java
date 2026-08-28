package com.google.android.gms.analytics;

import android.content.Context;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;

/* JADX INFO: loaded from: classes.dex */
class h implements m {
    private static final Object sf = new Object();
    private static h st;
    private final Context mContext;
    private String su;
    private boolean sv = false;
    private final Object sw = new Object();

    protected h(Context context) {
        this.mContext = context;
        ce();
    }

    private boolean D(String str) {
        try {
            aa.y("Storing clientId.");
            FileOutputStream fileOutputStreamOpenFileOutput = this.mContext.openFileOutput("gaClientId", 0);
            fileOutputStreamOpenFileOutput.write(str.getBytes());
            fileOutputStreamOpenFileOutput.close();
            return true;
        } catch (FileNotFoundException e) {
            aa.w("Error creating clientId file.");
            return false;
        } catch (IOException e2) {
            aa.w("Error writing to clientId file.");
            return false;
        }
    }

    public static h cb() {
        h hVar;
        synchronized (sf) {
            hVar = st;
        }
        return hVar;
    }

    private String cc() {
        if (!this.sv) {
            synchronized (this.sw) {
                if (!this.sv) {
                    aa.y("Waiting for clientId to load");
                    do {
                        try {
                            this.sw.wait();
                        } catch (InterruptedException e) {
                            aa.w("Exception while waiting for clientId: " + e);
                        }
                    } while (!this.sv);
                }
            }
        }
        aa.y("Loaded clientId");
        return this.su;
    }

    private void ce() {
        new Thread("client_id_fetcher") { // from class: com.google.android.gms.analytics.h.1
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                synchronized (h.this.sw) {
                    h.this.su = h.this.cf();
                    h.this.sv = true;
                    h.this.sw.notifyAll();
                }
            }
        }.start();
    }

    public static void n(Context context) {
        synchronized (sf) {
            if (st == null) {
                st = new h(context);
            }
        }
    }

    public boolean C(String str) {
        return "&cid".equals(str);
    }

    protected String cd() {
        String lowerCase = UUID.randomUUID().toString().toLowerCase();
        try {
            return !D(lowerCase) ? "0" : lowerCase;
        } catch (Exception e) {
            return null;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:27:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x002b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    java.lang.String cf() {
        /*
            r6 = this;
            r0 = 0
            android.content.Context r1 = r6.mContext     // Catch: java.io.FileNotFoundException -> L42 java.io.IOException -> L4f
            java.lang.String r2 = "gaClientId"
            java.io.FileInputStream r2 = r1.openFileInput(r2)     // Catch: java.io.FileNotFoundException -> L42 java.io.IOException -> L4f
            r1 = 128(0x80, float:1.8E-43)
            byte[] r3 = new byte[r1]     // Catch: java.io.FileNotFoundException -> L42 java.io.IOException -> L4f
            r1 = 0
            r4 = 128(0x80, float:1.8E-43)
            int r4 = r2.read(r3, r1, r4)     // Catch: java.io.FileNotFoundException -> L42 java.io.IOException -> L4f
            int r1 = r2.available()     // Catch: java.io.FileNotFoundException -> L42 java.io.IOException -> L4f
            if (r1 <= 0) goto L30
            java.lang.String r1 = "clientId file seems corrupted, deleting it."
            com.google.android.gms.analytics.aa.w(r1)     // Catch: java.io.FileNotFoundException -> L42 java.io.IOException -> L4f
            r2.close()     // Catch: java.io.FileNotFoundException -> L42 java.io.IOException -> L4f
            android.content.Context r1 = r6.mContext     // Catch: java.io.FileNotFoundException -> L42 java.io.IOException -> L4f
            java.lang.String r2 = "gaClientId"
            r1.deleteFile(r2)     // Catch: java.io.FileNotFoundException -> L42 java.io.IOException -> L4f
        L29:
            if (r0 != 0) goto L2f
            java.lang.String r0 = r6.cd()
        L2f:
            return r0
        L30:
            if (r4 > 0) goto L44
            java.lang.String r1 = "clientId file seems empty, deleting it."
            com.google.android.gms.analytics.aa.w(r1)     // Catch: java.io.FileNotFoundException -> L42 java.io.IOException -> L4f
            r2.close()     // Catch: java.io.FileNotFoundException -> L42 java.io.IOException -> L4f
            android.content.Context r1 = r6.mContext     // Catch: java.io.FileNotFoundException -> L42 java.io.IOException -> L4f
            java.lang.String r2 = "gaClientId"
            r1.deleteFile(r2)     // Catch: java.io.FileNotFoundException -> L42 java.io.IOException -> L4f
            goto L29
        L42:
            r1 = move-exception
            goto L29
        L44:
            java.lang.String r1 = new java.lang.String     // Catch: java.io.FileNotFoundException -> L42 java.io.IOException -> L4f
            r5 = 0
            r1.<init>(r3, r5, r4)     // Catch: java.io.FileNotFoundException -> L42 java.io.IOException -> L4f
            r2.close()     // Catch: java.io.IOException -> L5d java.io.FileNotFoundException -> L60
            r0 = r1
            goto L29
        L4f:
            r1 = move-exception
        L50:
            java.lang.String r1 = "Error reading clientId file, deleting it."
            com.google.android.gms.analytics.aa.w(r1)
            android.content.Context r1 = r6.mContext
            java.lang.String r2 = "gaClientId"
            r1.deleteFile(r2)
            goto L29
        L5d:
            r0 = move-exception
            r0 = r1
            goto L50
        L60:
            r0 = move-exception
            r0 = r1
            goto L29
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.analytics.h.cf():java.lang.String");
    }

    @Override // com.google.android.gms.analytics.m
    public String getValue(String field) {
        if ("&cid".equals(field)) {
            return cc();
        }
        return null;
    }
}
