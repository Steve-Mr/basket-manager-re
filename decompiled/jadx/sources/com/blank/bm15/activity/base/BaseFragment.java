package com.blank.bm15.activity.base;

import android.app.ActionBar;
import android.app.Fragment;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.blank.bm15.activity.HomeActivity;
import com.blank.bm15.model.object.crud.Game;

/* JADX INFO: loaded from: classes.dex */
public class BaseFragment extends Fragment {
    protected static String FRAGMENT_LAYOUT = "FRAGMENT_LAYOUT";
    protected static String NAVIGATION_MODE = "NAVIGATION_MODE";
    protected static String NAVIGATION_MODE_NULL = "NAVIGATION_MODE_NULL";
    protected Integer fragmentLayout;
    protected Fragment fragmentTab1;
    protected Fragment fragmentTab2;
    protected Fragment fragmentTab3;
    protected Fragment fragmentTab4;
    protected Integer navigationMode;
    protected View rootView;
    protected ActionBar.Tab tab1;
    protected ActionBar.Tab tab2;
    protected ActionBar.Tab tab3;
    protected ActionBar.Tab tab4;

    @Override // android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.fragmentLayout = Integer.valueOf(getArguments().getInt(FRAGMENT_LAYOUT));
        this.navigationMode = Integer.valueOf(getArguments().getInt(NAVIGATION_MODE));
        if (getArguments().getBoolean(NAVIGATION_MODE_NULL)) {
            this.navigationMode = null;
        }
    }

    @Override // android.app.Fragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        this.rootView = inflater.inflate(this.fragmentLayout.intValue(), container, false);
        return this.rootView;
    }

    @Override // android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        if (this.navigationMode != null) {
            getActionBar().removeAllTabs();
            getActionBar().setNavigationMode(this.navigationMode.intValue());
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public HomeActivity getHomeActivity() {
        HomeActivity activity = (HomeActivity) getActivity();
        return activity;
    }

    protected ActionBar getActionBar() {
        return getHomeActivity().getActionBar();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public Game getGame() {
        return getHomeActivity().getGame();
    }
}
