package com.blank.bm15.activity.fragment;

import android.os.Bundle;
import android.view.View;
import android.widget.ListAdapter;
import android.widget.ListView;
import com.blank.bm15.activity.adapter.AdapterMatchResultList;
import com.blank.bm15.activity.base.BaseActivity;
import com.blank.bm15.activity.base.BaseFragment;
import com.blank.bm15.dao.BlankDao;
import com.blank.bm15.dao.BlankDaoExtra;
import com.blank.bm15.model.comparator.MatchResultComparator;
import com.blank.bm15.model.object.crud.Match;
import com.blank.bm15.model.object.crud.MatchResult;
import com.blank.bm15.model.object.crud.Navigation;
import com.blank.bm15.model.object.crud.Player;
import com.blank.bm15.model.object.crud.Team;
import com.blank.bm15pro.R;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* loaded from: classes.dex */
public class TeamStatisticsFragment extends BaseFragment {
    public static final TeamStatisticsFragment newInstance(int fragmentLayout) {
        TeamStatisticsFragment fragment = new TeamStatisticsFragment();
        Bundle args = new Bundle(2);
        args.putInt(FRAGMENT_LAYOUT, fragmentLayout);
        args.putBoolean(NAVIGATION_MODE_NULL, Boolean.TRUE.booleanValue());
        fragment.setArguments(args);
        return fragment;
    }

    @Override // com.blank.bm15.activity.base.BaseFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        Navigation navigation = BaseActivity.getNavigation(getHomeActivity());
        Integer idTeam = navigation.getIdObject();
        Team team = new Team(getHomeActivity());
        team.setId(idTeam);
        BlankDao.loadById(team);
        TeamAllFragments.loadHeader(getHomeActivity(), this.rootView, team);
        ListView listView = (ListView) this.rootView.findViewById(R.id.fragmentTeamStatisticsListViewTeam);
        listView.setAdapter((ListAdapter) getAdapter(team));
    }

    private AdapterMatchResultList getAdapter(Team team) {
        List<MatchResult> matchResultList = new ArrayList<>();
        MatchResult teamMatchResult = new MatchResult(getHomeActivity());
        for (Player player : team.getTactic().getPlayers()) {
            MatchResult playerMatchResult = getPlayerMatchResult(player);
            playerMatchResult.setName(player.getShortName());
            teamMatchResult.addMatchResult(playerMatchResult);
            matchResultList.add(playerMatchResult);
        }
        Collections.sort(matchResultList, new MatchResultComparator(0, -1));
        Match match = new Match(getHomeActivity());
        match.setTeamLocal(team);
        match.setGame(getHomeActivity().getGame());
        teamMatchResult.setMatches(Integer.valueOf(BlankDaoExtra.getPlayedMatchesTeam(match).size()));
        matchResultList.add(teamMatchResult);
        matchResultList.add(0, new MatchResult(getHomeActivity()));
        return new AdapterMatchResultList(getHomeActivity(), R.layout.spinner_match_result, matchResultList, Boolean.TRUE);
    }

    private MatchResult getPlayerMatchResult(Player player) {
        MatchResult filter = new MatchResult(getHomeActivity());
        filter.setPlayer(player);
        List<MatchResult> matchResultList = BlankDao.getSome(filter);
        MatchResult playerMatchResult = new MatchResult(getHomeActivity());
        playerMatchResult.setMatches(0);
        for (MatchResult matchResult : matchResultList) {
            playerMatchResult.addMatchResult(matchResult);
        }
        return playerMatchResult;
    }
}
