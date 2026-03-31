package com.blank.bm15.activity.fragment;

import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.ListAdapter;
import android.widget.ListView;
import com.blank.bm15.activity.adapter.AdapterCalendarList;
import com.blank.bm15.activity.adapter.AdapterMatchList;
import com.blank.bm15.activity.adapter.SeparatedListAdapter;
import com.blank.bm15.activity.base.BaseFragment;
import com.blank.bm15.dao.BlankDao;
import com.blank.bm15.dao.BlankDaoExtra;
import com.blank.bm15.model.object.crud.Match;
import com.blank.bm15pro.R;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes.dex */
public class CalendarMatchFragment extends BaseFragment {
    public CalendarAllFragments calendarAllFragments;
    private Integer matchday;

    public static final CalendarMatchFragment newInstance(int fragmentLayout, CalendarAllFragments calendarAllFragments) {
        CalendarMatchFragment fragment = new CalendarMatchFragment();
        Bundle args = new Bundle(2);
        args.putInt(FRAGMENT_LAYOUT, fragmentLayout);
        args.putBoolean(NAVIGATION_MODE_NULL, Boolean.TRUE.booleanValue());
        fragment.setArguments(args);
        fragment.calendarAllFragments = calendarAllFragments;
        return fragment;
    }

    @Override // com.blank.bm15.activity.base.BaseFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        createPage();
    }

    private void createPage() {
        this.matchday = getGame().getCurrentMatchday();
        Button button = (Button) this.rootView.findViewById(R.id.fragmentCalendarButtonPlay);
        button.setOnClickListener(new View.OnClickListener() { // from class: com.blank.bm15.activity.fragment.CalendarMatchFragment.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                CalendarMatchFragment.this.getHomeActivity().play(CalendarMatchFragment.this.matchday.intValue());
            }
        });
        Match filter = new Match(getHomeActivity());
        filter.setGame(getGame());
        List<Match> auxList = BlankDaoExtra.getUserMatchCalendar(filter);
        List<Match> calendarList = new ArrayList<>();
        for (int i = 1; i <= 234; i++) {
            calendarList.add(getMatch(auxList, i));
        }
        final ListView calendarListView = (ListView) this.rootView.findViewById(R.id.fragmentCalendarListViewCalendar);
        calendarListView.setAdapter((ListAdapter) new AdapterCalendarList(getHomeActivity(), R.layout.spinner_calendar, calendarList));
        calendarListView.setSelection(getGame().getCurrentMatchday().intValue() - 4);
        calendarListView.setOnItemClickListener(new AdapterView.OnItemClickListener() { // from class: com.blank.bm15.activity.fragment.CalendarMatchFragment.2
            @Override // android.widget.AdapterView.OnItemClickListener
            public void onItemClick(AdapterView<?> arg0, View arg1, int position, long arg3) {
                Match match = (Match) calendarListView.getItemAtPosition(position);
                CalendarMatchFragment.this.matchday = match.getMatchday();
                CalendarMatchFragment.this.updateMatchList();
            }
        });
        calendarListView.setOnItemLongClickListener(new AdapterView.OnItemLongClickListener() { // from class: com.blank.bm15.activity.fragment.CalendarMatchFragment.3
            @Override // android.widget.AdapterView.OnItemLongClickListener
            public boolean onItemLongClick(AdapterView<?> arg0, View arg1, int position, long arg3) {
                Match match = (Match) calendarListView.getItemAtPosition(position);
                if (match.getMatchday().intValue() <= 226 && match.getMatchday().intValue() > CalendarMatchFragment.this.getGame().getCurrentMatchday().intValue()) {
                    CalendarMatchFragment.this.getHomeActivity().play(match.getMatchday().intValue());
                }
                return Boolean.TRUE.booleanValue();
            }
        });
        updateMatchList();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateMatchList() {
        Button button = (Button) this.rootView.findViewById(R.id.fragmentCalendarButtonPlay);
        if (this.matchday.intValue() <= 226 && this.matchday.intValue() > getGame().getCurrentMatchday().intValue()) {
            button.setVisibility(0);
        } else {
            button.setVisibility(8);
        }
        Match filter = new Match(getHomeActivity());
        filter.setGame(getGame());
        filter.setMatchday(this.matchday);
        List<Match> matchList = BlankDao.getSome(filter);
        SeparatedListAdapter separatedAdapter = new SeparatedListAdapter(getHomeActivity());
        AdapterMatchList adapter = new AdapterMatchList(getHomeActivity(), R.layout.spinner_match, matchList);
        separatedAdapter.addSection(String.valueOf(getHomeActivity().getString(R.string.current_matchday)) + ": " + this.matchday, adapter);
        final ListView matchListView = (ListView) this.rootView.findViewById(R.id.fragmentCalendarListViewMatch);
        matchListView.setAdapter((ListAdapter) separatedAdapter);
        matchListView.setOnItemClickListener(new AdapterView.OnItemClickListener() { // from class: com.blank.bm15.activity.fragment.CalendarMatchFragment.4
            @Override // android.widget.AdapterView.OnItemClickListener
            public void onItemClick(AdapterView<?> arg0, View arg1, int position, long arg3) {
                Match match = (Match) matchListView.getItemAtPosition(position);
                CalendarMatchFragment.this.calendarAllFragments.loadMatch(match);
            }
        });
    }

    private Match getMatch(List<Match> calendarList, int matchday) {
        for (Match match : calendarList) {
            if (match.getMatchday().intValue() == matchday) {
                return match;
            }
            if (match.getMatchday().intValue() > matchday) {
                break;
            }
        }
        Match match2 = new Match(getHomeActivity());
        match2.setMatchday(Integer.valueOf(matchday));
        return match2;
    }
}
