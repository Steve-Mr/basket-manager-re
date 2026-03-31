package com.blank.bm15.activity.fragment;

import android.os.Bundle;
import android.view.View;
import com.blank.bm15.activity.base.BaseFragment;
import com.blank.bm15.activity.base.BaseTabListener;
import com.blank.bm15pro.R;

/* loaded from: classes.dex */
public class RookiesAllFragments extends BaseFragment {
    public static final RookiesAllFragments newInstance(int fragmentLayout, Integer navigationMode) {
        RookiesAllFragments fragment = new RookiesAllFragments();
        Bundle args = new Bundle(2);
        args.putInt(FRAGMENT_LAYOUT, fragmentLayout);
        args.putInt(NAVIGATION_MODE, navigationMode.intValue());
        fragment.setArguments(args);
        return fragment;
    }

    @Override // com.blank.bm15.activity.base.BaseFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        this.fragmentTab1 = RookiesPlayersFragment.newInstance(R.layout.fragment_top_100);
        this.fragmentTab2 = RookiesStatisticsFragment.newInstance(R.layout.fragment_top_100);
        this.tab1 = getActionBar().newTab().setText(getHomeActivity().getString(R.string.rookies_tab_players));
        this.tab2 = getActionBar().newTab().setText(getHomeActivity().getString(R.string.rookies_tab_statistics));
        this.tab1.setTabListener(new BaseTabListener(this.fragmentTab1));
        this.tab2.setTabListener(new BaseTabListener(this.fragmentTab2));
        getActionBar().addTab(this.tab1);
        getActionBar().addTab(this.tab2);
    }
}
