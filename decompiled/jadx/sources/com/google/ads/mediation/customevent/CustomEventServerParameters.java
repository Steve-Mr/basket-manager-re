package com.google.ads.mediation.customevent;

import com.blank.bm15pro.BuildConfig;
import com.google.ads.mediation.MediationServerParameters;
import com.google.android.gms.plus.PlusShare;

/* JADX INFO: loaded from: classes.dex */
public final class CustomEventServerParameters extends MediationServerParameters {

    @MediationServerParameters.Parameter(name = "class_name", required = BuildConfig.DEBUG)
    public String className;

    @MediationServerParameters.Parameter(name = PlusShare.KEY_CALL_TO_ACTION_LABEL, required = BuildConfig.DEBUG)
    public String label;

    @MediationServerParameters.Parameter(name = "parameter", required = false)
    public String parameter = null;
}
