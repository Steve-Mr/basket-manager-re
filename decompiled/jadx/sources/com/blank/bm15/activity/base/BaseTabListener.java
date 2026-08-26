package com.blank.bm15.activity.base;

import android.app.ActionBar;
import android.app.Fragment;
import android.app.FragmentTransaction;
import com.blank.bm15pro.R;

/* JADX INFO: loaded from: classes.dex */
public class BaseTabListener implements ActionBar.TabListener {
    Fragment fragment;

    public BaseTabListener(Fragment fragment) {
        this.fragment = fragment;
    }

    @Override // android.app.ActionBar.TabListener
    public void onTabSelected(ActionBar.Tab tab, FragmentTransaction ft) {
        ft.replace(R.id.fragment_container, this.fragment);
    }

    @Override // android.app.ActionBar.TabListener
    public void onTabUnselected(ActionBar.Tab tab, FragmentTransaction ft) {
        ft.remove(this.fragment);
    }

    @Override // android.app.ActionBar.TabListener
    public void onTabReselected(ActionBar.Tab tab, FragmentTransaction ft) {
    }
}
