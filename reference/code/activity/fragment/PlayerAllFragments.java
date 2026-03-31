package com.blank.bm15.activity.fragment;

import android.os.Bundle;
import android.view.View;
import com.blank.bm15.activity.base.BaseFragment;
import com.blank.bm15.activity.base.BaseTabListener;
import com.blank.bm15pro.R;

/* loaded from: classes.dex */
public class PlayerAllFragments extends BaseFragment {
    public static final PlayerAllFragments newInstance(int fragmentLayout, Integer navigationMode) {
        PlayerAllFragments fragment = new PlayerAllFragments();
        Bundle args = new Bundle(2);
        args.putInt(FRAGMENT_LAYOUT, fragmentLayout);
        args.putInt(NAVIGATION_MODE, navigationMode.intValue());
        fragment.setArguments(args);
        return fragment;
    }

    @Override // com.blank.bm15.activity.base.BaseFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        this.fragmentTab1 = PlayerSkillsFragment.newInstance(R.layout.fragment_player_skills);
        this.fragmentTab2 = PlayerStatisticsFragment.newInstance(R.layout.fragment_player_statistics);
        this.tab1 = getActionBar().newTab().setText(getHomeActivity().getString(R.string.player_tab_skills));
        this.tab2 = getActionBar().newTab().setText(getHomeActivity().getString(R.string.player_tab_statistic));
        this.tab1.setTabListener(new BaseTabListener(this.fragmentTab1));
        this.tab2.setTabListener(new BaseTabListener(this.fragmentTab2));
        getActionBar().addTab(this.tab1);
        getActionBar().addTab(this.tab2);
    }
}
