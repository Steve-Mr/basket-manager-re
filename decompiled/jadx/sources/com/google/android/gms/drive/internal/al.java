package com.google.android.gms.drive.internal;

import android.os.RemoteException;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.a;

/* JADX INFO: loaded from: classes.dex */
public class al extends c {
    private final a.d<Status> wH;

    public al(a.d<Status> dVar) {
        this.wH = dVar;
    }

    @Override // com.google.android.gms.drive.internal.c, com.google.android.gms.drive.internal.v
    public void m(Status status) throws RemoteException {
        this.wH.b(status);
    }

    @Override // com.google.android.gms.drive.internal.c, com.google.android.gms.drive.internal.v
    public void onSuccess() throws RemoteException {
        this.wH.b(Status.Bv);
    }
}
