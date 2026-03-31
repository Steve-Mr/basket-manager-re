package com.blank.bm15.activity.fragment;

import android.os.Bundle;
import android.view.View;
import android.widget.ListAdapter;
import android.widget.ListView;
import com.blank.bm15.activity.adapter.AdapterGameResultList;
import com.blank.bm15.activity.adapter.AdapterMatchResultList;
import com.blank.bm15.activity.adapter.SeparatedListAdapter;
import com.blank.bm15.activity.base.BaseFragment;
import com.blank.bm15.dao.BlankDao;
import com.blank.bm15.model.comparator.MatchResultComparator;
import com.blank.bm15.model.object.crud.Match;
import com.blank.bm15.model.object.crud.MatchResult;
import com.blank.bm15.model.object.crud.Team;
import com.blank.bm15pro.R;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* loaded from: classes.dex */
public class CalendarMatchResultFragment extends BaseFragment {
    private Match match;

    public static final CalendarMatchResultFragment newInstance(int fragmentLayout) {
        CalendarMatchResultFragment fragment = new CalendarMatchResultFragment();
        Bundle args = new Bundle(2);
        args.putInt(FRAGMENT_LAYOUT, fragmentLayout);
        args.putBoolean(NAVIGATION_MODE_NULL, Boolean.TRUE.booleanValue());
        fragment.setArguments(args);
        return fragment;
    }

    @Override // com.blank.bm15.activity.base.BaseFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        ListView listView = (ListView) this.rootView.findViewById(R.id.fragmentLisView);
        listView.setAdapter((ListAdapter) getAdapter());
    }

    private SeparatedListAdapter getAdapter() {
        MatchResult filter = new MatchResult(getHomeActivity());
        filter.setMatch(getMatch());
        List<MatchResult> matchResultList = BlankDao.getSome(filter);
        List<Match> matchList = new ArrayList<>();
        matchList.add(getMatch());
        matchList.add(getMatch());
        matchList.add(getMatch());
        SeparatedListAdapter separatedAdapter = new SeparatedListAdapter(getHomeActivity());
        AdapterGameResultList adapterGame = new AdapterGameResultList(getHomeActivity(), R.layout.spinner_game_result, matchList);
        separatedAdapter.addSection(String.valueOf(getHomeActivity().getString(R.string.current_matchday)) + ": " + getMatch().getMatchday(), adapterGame);
        AdapterMatchResultList adapter = new AdapterMatchResultList(getHomeActivity(), R.layout.spinner_match_result, getTeamMatchResults(matchResultList, getMatch().getTeamLocal()), Boolean.FALSE);
        separatedAdapter.addSection(String.valueOf(getMatch().getTeamLocal().getFullName()) + " " + getHomeActivity().getString(R.string.calendar_local), adapter);
        AdapterMatchResultList adapter2 = new AdapterMatchResultList(getHomeActivity(), R.layout.spinner_match_result, getTeamMatchResults(matchResultList, this.match.getTeamVisitor()), Boolean.FALSE);
        separatedAdapter.addSection(String.valueOf(getMatch().getTeamVisitor().getFullName()) + " " + getHomeActivity().getString(R.string.calendar_visitor), adapter2);
        return separatedAdapter;
    }

    private List<MatchResult> getTeamMatchResults(List<MatchResult> matchResultList, Team team) {
        List<MatchResult> teamMatchResultList = new ArrayList<>();
        MatchResult total = new MatchResult(getHomeActivity());
        for (MatchResult matchResult : matchResultList) {
            if (matchResult.getPlayer().getTeam().getId().intValue() == team.getId().intValue()) {
                teamMatchResultList.add(matchResult);
                total.addMatchResult(matchResult);
            }
        }
        Collections.sort(teamMatchResultList, new MatchResultComparator(0, -1));
        if (matchResultList.size() > 0) {
            teamMatchResultList.add(0, new MatchResult(getHomeActivity()));
        }
        total.setMatches(1);
        teamMatchResultList.add(total);
        return teamMatchResultList;
    }

    public Match getMatch() {
        if (this.match == null) {
            this.match = new Match(getHomeActivity());
        }
        return this.match;
    }

    public void setMatch(Match match) {
        this.match = match;
    }
}
