package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.dynamic.d;

/* JADX INFO: loaded from: classes.dex */
public interface fn extends IInterface {

    public static abstract class a extends Binder implements fn {

        /* JADX INFO: renamed from: com.google.android.gms.internal.fn$a$a, reason: collision with other inner class name */
        private static class C0052a implements fn {
            private IBinder kn;

            C0052a(IBinder iBinder) {
                this.kn = iBinder;
            }

            @Override // com.google.android.gms.internal.fn
            public com.google.android.gms.dynamic.d a(com.google.android.gms.dynamic.d dVar, int i, int i2) throws RemoteException {
                Parcel parcelObtain = Parcel.obtain();
                Parcel parcelObtain2 = Parcel.obtain();
                try {
                    parcelObtain.writeInterfaceToken("com.google.android.gms.common.internal.ISignInButtonCreator");
                    parcelObtain.writeStrongBinder(dVar != null ? dVar.asBinder() : null);
                    parcelObtain.writeInt(i);
                    parcelObtain.writeInt(i2);
                    this.kn.transact(1, parcelObtain, parcelObtain2, 0);
                    parcelObtain2.readException();
                    return d.a.K(parcelObtain2.readStrongBinder());
                } finally {
                    parcelObtain2.recycle();
                    parcelObtain.recycle();
                }
            }

            @Override // android.os.IInterface
            public IBinder asBinder() {
                return this.kn;
            }
        }

        public static fn D(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.common.internal.ISignInButtonCreator");
            return (iInterfaceQueryLocalInterface == null || !(iInterfaceQueryLocalInterface instanceof fn)) ? new C0052a(iBinder) : (fn) iInterfaceQueryLocalInterface;
        }

        @Override // android.os.Binder
        public boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            switch (code) {
                case 1:
                    data.enforceInterface("com.google.android.gms.common.internal.ISignInButtonCreator");
                    com.google.android.gms.dynamic.d dVarA = a(d.a.K(data.readStrongBinder()), data.readInt(), data.readInt());
                    reply.writeNoException();
                    reply.writeStrongBinder(dVarA != null ? dVarA.asBinder() : null);
                    return true;
                case 1598968902:
                    reply.writeString("com.google.android.gms.common.internal.ISignInButtonCreator");
                    return true;
                default:
                    return super.onTransact(code, data, reply, flags);
            }
        }
    }

    com.google.android.gms.dynamic.d a(com.google.android.gms.dynamic.d dVar, int i, int i2) throws RemoteException;
}
