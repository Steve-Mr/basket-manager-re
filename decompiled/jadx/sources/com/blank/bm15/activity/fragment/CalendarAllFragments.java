package com.blank.bm15.activity.fragment;

import android.os.Bundle;
import android.view.View;
import com.blank.bm15.activity.base.BaseFragment;
import com.blank.bm15.activity.base.BaseTabListener;
import com.blank.bm15.model.object.crud.Match;
import com.blank.bm15pro.R;

/* JADX INFO: loaded from: classes.dex */
public class CalendarAllFragments extends BaseFragment {
    public static final CalendarAllFragments newInstance(int fragmentLayout, Integer navigationMode) {
        CalendarAllFragments fragment = new CalendarAllFragments();
        Bundle args = new Bundle(2);
        args.putInt(FRAGMENT_LAYOUT, fragmentLayout);
        args.putInt(NAVIGATION_MODE, navigationMode.intValue());
        fragment.setArguments(args);
        return fragment;
    }

    @Override // com.blank.bm15.activity.base.BaseFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        this.fragmentTab1 = CalendarMatchFragment.newInstance(R.layout.fragment_calendar, this);
        this.fragmentTab2 = CalendarMatchResultFragment.newInstance(R.layout.fragment_list);
        this.tab1 = getActionBar().newTab().setText(getHomeActivity().getString(R.string.calendar_matchdays));
        this.tab1.setTabListener(new BaseTabListener(this.fragmentTab1));
        getActionBar().addTab(this.tab1);
    }

    public void loadMatch(Match match) {
        if (this.tab2 == null) {
            this.tab2 = getActionBar().newTab().setText(getHomeActivity().getString(R.string.calendar_statistics));
            this.tab2.setTabListener(new BaseTabListener(this.fragmentTab2));
            getActionBar().addTab(this.tab2);
        }
        ((CalendarMatchResultFragment) this.fragmentTab2).setMatch(match);
        getActionBar().setSelectedNavigationItem(1);
    }
}
