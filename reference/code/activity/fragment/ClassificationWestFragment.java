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
import com.blank.bm15.model.object.other.Classification;
import com.blank.bm15.model.util.Util;
import com.blank.bm15pro.R;
import java.util.List;

/* loaded from: classes.dex */
public class ClassificationWestFragment extends BaseFragment {
    private List<Classification> westConferenceList;

    public static final ClassificationWestFragment newInstance(int fragmentLayout) {
        ClassificationWestFragment fragment = new ClassificationWestFragment();
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
        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() { // from class: com.blank.bm15.activity.fragment.ClassificationWestFragment.1
            @Override // android.widget.AdapterView.OnItemClickListener
            public void onItemClick(AdapterView<?> arg0, View arg1, int position, long arg3) {
                Classification classification = (Classification) listView.getItemAtPosition(position);
                BaseActivity.addNavigation(ClassificationWestFragment.this.getHomeActivity(), 10, classification.getTeam().getId());
                ClassificationWestFragment.this.startActivity(new Intent(ClassificationWestFragment.this.getHomeActivity(), (Class<?>) HomeActivity.class));
            }
        });
    }

    private SeparatedListAdapter getAdapter() {
        SeparatedListAdapter separatedAdapter = new SeparatedListAdapter(getHomeActivity());
        AdapterClassificationList adapter = new AdapterClassificationList(getHomeActivity(), R.layout.spinner_team, getClassification(4));
        separatedAdapter.addSection(Util.getDivision(getHomeActivity(), 4), adapter);
        AdapterClassificationList adapter2 = new AdapterClassificationList(getHomeActivity(), R.layout.spinner_team, getClassification(5));
        separatedAdapter.addSection(Util.getDivision(getHomeActivity(), 5), adapter2);
        AdapterClassificationList adapter3 = new AdapterClassificationList(getHomeActivity(), R.layout.spinner_team, getClassification(6));
        separatedAdapter.addSection(Util.getDivision(getHomeActivity(), 6), adapter3);
        return separatedAdapter;
    }

    private List<Classification> getClassification(int division) {
        Classification classification = new Classification(getHomeActivity());
        classification.setGame(getGame());
        classification.setDivision(Integer.valueOf(division));
        List<Classification> list = BlankDaoExtra.getClassification(classification);
        int i = 1;
        while (i <= list.size()) {
            Classification classification2 = list.get(i - 1);
            classification2.setPositionInDivision(Integer.valueOf(i));
            setPositionInConference(classification2);
            classification2.setIsClassified(Boolean.valueOf(i == 8 || classification2.getPositionInConference().intValue() <= 8));
            i++;
        }
        return list;
    }

    private void setPositionInConference(Classification classification) {
        for (int i = 1; i <= getWestConferenceList().size(); i++) {
            Classification aux = getWestConferenceList().get(i - 1);
            if (aux.getTeam().getId().intValue() == classification.getTeam().getId().intValue()) {
                classification.setPositionInConference(Integer.valueOf(i));
                return;
            }
        }
    }

    private List<Classification> getWestConferenceList() {
        if (this.westConferenceList == null) {
            Classification filter = new Classification(getHomeActivity());
            filter.setGame(getGame());
            filter.setConference(2);
            this.westConferenceList = BlankDaoExtra.getClassification(filter);
        }
        return this.westConferenceList;
    }
}
