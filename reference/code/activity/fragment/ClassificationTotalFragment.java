package com.blank.bm15.activity.fragment;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListAdapter;
import android.widget.ListView;
import com.blank.bm15.activity.HomeActivity;
import com.blank.bm15.activity.adapter.AdapterClassificationList;
import com.blank.bm15.activity.adapter.SeparatedListAdapter;
import com.blank.bm15.activity.base.BaseActivity;
import com.blank.bm15.activity.base.BaseFragment;
import com.blank.bm15.dao.BlankDaoExtra;
import com.blank.bm15.model.object.crud.Game;
import com.blank.bm15.model.object.other.Classification;
import com.blank.bm15.model.util.Util;
import com.blank.bm15pro.R;
import java.util.List;

/* loaded from: classes.dex */
public class ClassificationTotalFragment extends BaseFragment {
    public static final ClassificationTotalFragment newInstance(int fragmentLayout) {
        ClassificationTotalFragment fragment = new ClassificationTotalFragment();
        Bundle args = new Bundle(2);
        args.putInt(FRAGMENT_LAYOUT, fragmentLayout);
        args.putBoolean(NAVIGATION_MODE_NULL, Boolean.TRUE.booleanValue());
        fragment.setArguments(args);
        return fragment;
    }

    @Override // com.blank.bm15.activity.base.BaseFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        final ListView listView = (ListView) this.rootView.findViewById(R.id.fragmentLisView);
        listView.setAdapter((ListAdapter) getAdapter());
        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() { // from class: com.blank.bm15.activity.fragment.ClassificationTotalFragment.1
            @Override // android.widget.AdapterView.OnItemClickListener
            public void onItemClick(AdapterView<?> arg0, View arg1, int position, long arg3) {
                Classification classification = (Classification) listView.getItemAtPosition(position);
                BaseActivity.addNavigation(ClassificationTotalFragment.this.getHomeActivity(), 10, classification.getTeam().getId());
                ClassificationTotalFragment.this.startActivity(new Intent(ClassificationTotalFragment.this.getHomeActivity(), (Class<?>) HomeActivity.class));
            }
        });
    }

    private SeparatedListAdapter getAdapter() {
        SeparatedListAdapter separatedAdapter = new SeparatedListAdapter(getHomeActivity());
        AdapterClassificationList adapter = new AdapterClassificationList(getHomeActivity(), R.layout.spinner_team, getClassification(getGame(), 1));
        separatedAdapter.addSection(Util.getConference(getHomeActivity(), 1), adapter);
        AdapterClassificationList adapter2 = new AdapterClassificationList(getHomeActivity(), R.layout.spinner_team, getClassification(getGame(), 2));
        separatedAdapter.addSection(Util.getConference(getHomeActivity(), 2), adapter2);
        return separatedAdapter;
    }

    public static List<Classification> getClassification(Game game, int conference) {
        Classification classification = new Classification(game.getContext());
        classification.setGame(game);
        classification.setConference(Integer.valueOf(conference));
        List<Classification> list = BlankDaoExtra.getClassification(classification);
        int classifieds = 0;
        for (int i = 1; i <= list.size(); i++) {
            Classification classification2 = list.get(i - 1);
            setPositionInDivision(game, classification2);
            classification2.setIsClassified(Boolean.valueOf(classification2.getPositionInDivision().intValue() == 1));
            if (classification2.getIsClassified().booleanValue()) {
                classifieds++;
            }
        }
        for (int i2 = 1; i2 <= list.size(); i2++) {
            Classification classification3 = list.get(i2 - 1);
            if (classifieds < 8 && !classification3.getIsClassified().booleanValue()) {
                classification3.setIsClassified(Boolean.TRUE);
                classifieds++;
            }
        }
        return list;
    }

    private static void setPositionInDivision(Game game, Classification classification) {
        Classification filter = new Classification(game.getContext());
        filter.setGame(game);
        filter.setDivision(classification.getDivision());
        List<Classification> list = BlankDaoExtra.getClassification(filter);
        for (int i = 1; i <= list.size(); i++) {
            Classification aux = list.get(i - 1);
            if (aux.getTeam().getId().intValue() == classification.getTeam().getId().intValue()) {
                classification.setPositionInDivision(Integer.valueOf(i));
                return;
            }
        }
    }
}
