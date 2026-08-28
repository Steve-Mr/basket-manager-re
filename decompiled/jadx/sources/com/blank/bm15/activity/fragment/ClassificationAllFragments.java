package com.blank.bm15.activity.fragment;

import android.os.Bundle;
import android.view.View;
import com.blank.bm15.activity.base.BaseFragment;
import com.blank.bm15.activity.base.BaseTabListener;
import com.blank.bm15pro.R;

/* JADX INFO: loaded from: classes.dex */
public class ClassificationAllFragments extends BaseFragment {
    public static final ClassificationAllFragments newInstance(int fragmentLayout, Integer navigationMode) {
        ClassificationAllFragments fragment = new ClassificationAllFragments();
        Bundle args = new Bundle(2);
        args.putInt(FRAGMENT_LAYOUT, fragmentLayout);
        args.putInt(NAVIGATION_MODE, navigationMode.intValue());
        fragment.setArguments(args);
        return fragment;
    }

    @Override // com.blank.bm15.activity.base.BaseFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        this.fragmentTab1 = ClassificationWestFragment.newInstance(R.layout.fragment_list);
        this.fragmentTab2 = ClassificationTotalFragment.newInstance(R.layout.fragment_list);
        this.fragmentTab3 = ClassificationEastFragment.newInstance(R.layout.fragment_list);
        this.tab1 = getActionBar().newTab().setText(getHomeActivity().getString(R.string.conference_west));
        this.tab2 = getActionBar().newTab().setText(getHomeActivity().getString(R.string.conference_playoffs));
        this.tab3 = getActionBar().newTab().setText(getHomeActivity().getString(R.string.conference_east));
        this.tab1.setTabListener(new BaseTabListener(this.fragmentTab1));
        this.tab2.setTabListener(new BaseTabListener(this.fragmentTab2));
        this.tab3.setTabListener(new BaseTabListener(this.fragmentTab3));
        getActionBar().addTab(this.tab1);
        getActionBar().addTab(this.tab2);
        getActionBar().addTab(this.tab3);
        if (getGame().getUserTeam().getConference().intValue() == 2) {
            getActionBar().setSelectedNavigationItem(0);
        } else {
            getActionBar().setSelectedNavigationItem(2);
        }
    }
}
