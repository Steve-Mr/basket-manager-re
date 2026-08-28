package com.blank.bm15.activity.fragment;

import android.os.Bundle;
import android.view.View;
import android.widget.ListAdapter;
import android.widget.ListView;
import com.blank.bm15.activity.adapter.AdapterPlayoffsList;
import com.blank.bm15.activity.adapter.SeparatedListAdapter;
import com.blank.bm15.activity.base.BaseFragment;
import com.blank.bm15.dao.BlankDao;
import com.blank.bm15.model.comparator.MatchPlayoffsComparator;
import com.blank.bm15.model.object.crud.Playoffs;
import com.blank.bm15.model.object.other.MatchPlayoffs;
import com.blank.bm15pro.R;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class PlayoffsFragment extends BaseFragment {
    public static final PlayoffsFragment newInstance(int fragmentLayout, Integer navigationMode) {
        PlayoffsFragment fragment = new PlayoffsFragment();
        Bundle args = new Bundle(2);
        args.putInt(FRAGMENT_LAYOUT, fragmentLayout);
        args.putInt(NAVIGATION_MODE, navigationMode.intValue());
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
        Playoffs filter = new Playoffs(getHomeActivity());
        filter.setGame(getGame());
        List<Playoffs> playoffsList = BlankDao.getSome(filter);
        SeparatedListAdapter separatedAdapter = new SeparatedListAdapter(getHomeActivity());
        if (!getFinalMatch(playoffsList).isEmpty()) {
            AdapterPlayoffsList adapter = new AdapterPlayoffsList(getHomeActivity(), R.layout.spinner_playoffs, getFinalMatch(playoffsList));
            separatedAdapter.addSection(getResources().getString(R.string.playoffs_world), adapter);
        }
        if (!getConferenceMatchs(playoffsList).isEmpty()) {
            AdapterPlayoffsList adapter2 = new AdapterPlayoffsList(getHomeActivity(), R.layout.spinner_playoffs, getConferenceMatchs(playoffsList));
            separatedAdapter.addSection(getResources().getString(R.string.playoffs_conference), adapter2);
        }
        if (!getSemisMatchs(playoffsList).isEmpty()) {
            AdapterPlayoffsList adapter3 = new AdapterPlayoffsList(getHomeActivity(), R.layout.spinner_playoffs, getSemisMatchs(playoffsList));
            separatedAdapter.addSection(getResources().getString(R.string.playoffs_semifinals), adapter3);
        }
        if (!getQuarterMatchs(playoffsList).isEmpty()) {
            AdapterPlayoffsList adapter4 = new AdapterPlayoffsList(getHomeActivity(), R.layout.spinner_playoffs, getQuarterMatchs(playoffsList));
            separatedAdapter.addSection(getResources().getString(R.string.playoffs_quarters), adapter4);
        }
        return separatedAdapter;
    }

    private List<MatchPlayoffs> getQuarterMatchs(List<Playoffs> playoffsList) {
        Playoffs eastTeam1 = getPlayoffs(playoffsList, 1, 1);
        Playoffs eastTeam2 = getPlayoffs(playoffsList, 1, 2);
        Playoffs eastTeam3 = getPlayoffs(playoffsList, 1, 3);
        Playoffs eastTeam4 = getPlayoffs(playoffsList, 1, 4);
        Playoffs eastTeam5 = getPlayoffs(playoffsList, 1, 5);
        Playoffs eastTeam6 = getPlayoffs(playoffsList, 1, 6);
        Playoffs eastTeam7 = getPlayoffs(playoffsList, 1, 7);
        Playoffs eastTeam8 = getPlayoffs(playoffsList, 1, 8);
        Playoffs westTeam1 = getPlayoffs(playoffsList, 2, 1);
        Playoffs westTeam2 = getPlayoffs(playoffsList, 2, 2);
        Playoffs westTeam3 = getPlayoffs(playoffsList, 2, 3);
        Playoffs westTeam4 = getPlayoffs(playoffsList, 2, 4);
        Playoffs westTeam5 = getPlayoffs(playoffsList, 2, 5);
        Playoffs westTeam6 = getPlayoffs(playoffsList, 2, 6);
        Playoffs westTeam7 = getPlayoffs(playoffsList, 2, 7);
        Playoffs westTeam8 = getPlayoffs(playoffsList, 2, 8);
        List<MatchPlayoffs> matchPlayoffsList = new ArrayList<>();
        createMatchPlayoffs(matchPlayoffsList, eastTeam1, eastTeam8, 0);
        createMatchPlayoffs(matchPlayoffsList, eastTeam2, eastTeam7, 0);
        createMatchPlayoffs(matchPlayoffsList, eastTeam3, eastTeam6, 0);
        createMatchPlayoffs(matchPlayoffsList, eastTeam4, eastTeam5, 0);
        createMatchPlayoffs(matchPlayoffsList, westTeam1, westTeam8, 0);
        createMatchPlayoffs(matchPlayoffsList, westTeam2, westTeam7, 0);
        createMatchPlayoffs(matchPlayoffsList, westTeam3, westTeam6, 0);
        createMatchPlayoffs(matchPlayoffsList, westTeam4, westTeam5, 0);
        Collections.sort(matchPlayoffsList, new MatchPlayoffsComparator());
        return matchPlayoffsList;
    }

    private List<MatchPlayoffs> getSemisMatchs(List<Playoffs> playoffsList) {
        Playoffs eastSemis18;
        Playoffs eastSemis27;
        Playoffs eastSemis36;
        Playoffs eastSemis45;
        Playoffs westSemis18;
        Playoffs westSemis27;
        Playoffs westSemis36;
        Playoffs westSemis45;
        Playoffs eastTeam1 = getPlayoffs(playoffsList, 1, 1);
        Playoffs eastTeam2 = getPlayoffs(playoffsList, 1, 2);
        Playoffs eastTeam3 = getPlayoffs(playoffsList, 1, 3);
        Playoffs eastTeam4 = getPlayoffs(playoffsList, 1, 4);
        Playoffs eastTeam5 = getPlayoffs(playoffsList, 1, 5);
        Playoffs eastTeam6 = getPlayoffs(playoffsList, 1, 6);
        Playoffs eastTeam7 = getPlayoffs(playoffsList, 1, 7);
        Playoffs eastTeam8 = getPlayoffs(playoffsList, 1, 8);
        Playoffs westTeam1 = getPlayoffs(playoffsList, 2, 1);
        Playoffs westTeam2 = getPlayoffs(playoffsList, 2, 2);
        Playoffs westTeam3 = getPlayoffs(playoffsList, 2, 3);
        Playoffs westTeam4 = getPlayoffs(playoffsList, 2, 4);
        Playoffs westTeam5 = getPlayoffs(playoffsList, 2, 5);
        Playoffs westTeam6 = getPlayoffs(playoffsList, 2, 6);
        Playoffs westTeam7 = getPlayoffs(playoffsList, 2, 7);
        Playoffs westTeam8 = getPlayoffs(playoffsList, 2, 8);
        if (eastTeam1 == null || !eastTeam1.getIsInSeriesSemis().booleanValue()) {
            eastSemis18 = (eastTeam8 == null || !eastTeam8.getIsInSeriesSemis().booleanValue()) ? null : eastTeam8;
        } else {
            eastSemis18 = eastTeam1;
        }
        if (eastTeam2 == null || !eastTeam2.getIsInSeriesSemis().booleanValue()) {
            eastSemis27 = (eastTeam7 == null || !eastTeam7.getIsInSeriesSemis().booleanValue()) ? null : eastTeam7;
        } else {
            eastSemis27 = eastTeam2;
        }
        if (eastTeam3 == null || !eastTeam3.getIsInSeriesSemis().booleanValue()) {
            eastSemis36 = (eastTeam6 == null || !eastTeam6.getIsInSeriesSemis().booleanValue()) ? null : eastTeam6;
        } else {
            eastSemis36 = eastTeam3;
        }
        if (eastTeam4 == null || !eastTeam4.getIsInSeriesSemis().booleanValue()) {
            eastSemis45 = (eastTeam5 == null || !eastTeam5.getIsInSeriesSemis().booleanValue()) ? null : eastTeam5;
        } else {
            eastSemis45 = eastTeam4;
        }
        if (westTeam1 == null || !westTeam1.getIsInSeriesSemis().booleanValue()) {
            westSemis18 = (westTeam8 == null || !westTeam8.getIsInSeriesSemis().booleanValue()) ? null : westTeam8;
        } else {
            westSemis18 = westTeam1;
        }
        if (westTeam2 == null || !westTeam2.getIsInSeriesSemis().booleanValue()) {
            westSemis27 = (westTeam7 == null || !westTeam7.getIsInSeriesSemis().booleanValue()) ? null : westTeam7;
        } else {
            westSemis27 = westTeam2;
        }
        if (westTeam3 == null || !westTeam3.getIsInSeriesSemis().booleanValue()) {
            westSemis36 = (westTeam6 == null || !westTeam6.getIsInSeriesSemis().booleanValue()) ? null : westTeam6;
        } else {
            westSemis36 = westTeam3;
        }
        if (westTeam4 == null || !westTeam4.getIsInSeriesSemis().booleanValue()) {
            westSemis45 = (westTeam5 == null || !westTeam5.getIsInSeriesSemis().booleanValue()) ? null : westTeam5;
        } else {
            westSemis45 = westTeam4;
        }
        List<MatchPlayoffs> matchPlayoffsList = new ArrayList<>();
        createMatchPlayoffs(matchPlayoffsList, eastSemis18, eastSemis45, 4);
        createMatchPlayoffs(matchPlayoffsList, eastSemis27, eastSemis36, 4);
        createMatchPlayoffs(matchPlayoffsList, westSemis18, westSemis45, 4);
        createMatchPlayoffs(matchPlayoffsList, westSemis27, westSemis36, 4);
        Collections.sort(matchPlayoffsList, new MatchPlayoffsComparator());
        return matchPlayoffsList;
    }

    private List<MatchPlayoffs> getConferenceMatchs(List<Playoffs> playoffsList) {
        Playoffs eastSemis18;
        Playoffs eastSemis27;
        Playoffs eastSemis36;
        Playoffs eastSemis45;
        Playoffs westSemis18;
        Playoffs westSemis27;
        Playoffs westSemis36;
        Playoffs westSemis45;
        Playoffs eastSemis1845;
        Playoffs eastSemis2736;
        Playoffs westSemis1845;
        Playoffs westSemis2736;
        Playoffs eastTeam1 = getPlayoffs(playoffsList, 1, 1);
        Playoffs eastTeam2 = getPlayoffs(playoffsList, 1, 2);
        Playoffs eastTeam3 = getPlayoffs(playoffsList, 1, 3);
        Playoffs eastTeam4 = getPlayoffs(playoffsList, 1, 4);
        Playoffs eastTeam5 = getPlayoffs(playoffsList, 1, 5);
        Playoffs eastTeam6 = getPlayoffs(playoffsList, 1, 6);
        Playoffs eastTeam7 = getPlayoffs(playoffsList, 1, 7);
        Playoffs eastTeam8 = getPlayoffs(playoffsList, 1, 8);
        Playoffs westTeam1 = getPlayoffs(playoffsList, 2, 1);
        Playoffs westTeam2 = getPlayoffs(playoffsList, 2, 2);
        Playoffs westTeam3 = getPlayoffs(playoffsList, 2, 3);
        Playoffs westTeam4 = getPlayoffs(playoffsList, 2, 4);
        Playoffs westTeam5 = getPlayoffs(playoffsList, 2, 5);
        Playoffs westTeam6 = getPlayoffs(playoffsList, 2, 6);
        Playoffs westTeam7 = getPlayoffs(playoffsList, 2, 7);
        Playoffs westTeam8 = getPlayoffs(playoffsList, 2, 8);
        if (eastTeam1 == null || !eastTeam1.getIsInSeriesSemis().booleanValue()) {
            eastSemis18 = (eastTeam8 == null || !eastTeam8.getIsInSeriesSemis().booleanValue()) ? null : eastTeam8;
        } else {
            eastSemis18 = eastTeam1;
        }
        if (eastTeam2 == null || !eastTeam2.getIsInSeriesSemis().booleanValue()) {
            eastSemis27 = (eastTeam7 == null || !eastTeam7.getIsInSeriesSemis().booleanValue()) ? null : eastTeam7;
        } else {
            eastSemis27 = eastTeam2;
        }
        if (eastTeam3 == null || !eastTeam3.getIsInSeriesSemis().booleanValue()) {
            eastSemis36 = (eastTeam6 == null || !eastTeam6.getIsInSeriesSemis().booleanValue()) ? null : eastTeam6;
        } else {
            eastSemis36 = eastTeam3;
        }
        if (eastTeam4 == null || !eastTeam4.getIsInSeriesSemis().booleanValue()) {
            eastSemis45 = (eastTeam5 == null || !eastTeam5.getIsInSeriesSemis().booleanValue()) ? null : eastTeam5;
        } else {
            eastSemis45 = eastTeam4;
        }
        if (westTeam1 == null || !westTeam1.getIsInSeriesSemis().booleanValue()) {
            westSemis18 = (westTeam8 == null || !westTeam8.getIsInSeriesSemis().booleanValue()) ? null : westTeam8;
        } else {
            westSemis18 = westTeam1;
        }
        if (westTeam2 == null || !westTeam2.getIsInSeriesSemis().booleanValue()) {
            westSemis27 = (westTeam7 == null || !westTeam7.getIsInSeriesSemis().booleanValue()) ? null : westTeam7;
        } else {
            westSemis27 = westTeam2;
        }
        if (westTeam3 == null || !westTeam3.getIsInSeriesSemis().booleanValue()) {
            westSemis36 = (westTeam6 == null || !westTeam6.getIsInSeriesSemis().booleanValue()) ? null : westTeam6;
        } else {
            westSemis36 = westTeam3;
        }
        if (westTeam4 == null || !westTeam4.getIsInSeriesSemis().booleanValue()) {
            westSemis45 = (westTeam5 == null || !westTeam5.getIsInSeriesSemis().booleanValue()) ? null : westTeam5;
        } else {
            westSemis45 = westTeam4;
        }
        if (eastSemis18 == null || !eastSemis18.getIsInSeriesConferenceFinal().booleanValue()) {
            eastSemis1845 = (eastSemis45 == null || !eastSemis45.getIsInSeriesConferenceFinal().booleanValue()) ? null : eastSemis45;
        } else {
            eastSemis1845 = eastSemis18;
        }
        if (eastSemis27 == null || !eastSemis27.getIsInSeriesConferenceFinal().booleanValue()) {
            eastSemis2736 = (eastSemis36 == null || !eastSemis36.getIsInSeriesConferenceFinal().booleanValue()) ? null : eastSemis36;
        } else {
            eastSemis2736 = eastSemis27;
        }
        if (westSemis18 == null || !westSemis18.getIsInSeriesConferenceFinal().booleanValue()) {
            westSemis1845 = (westSemis45 == null || !westSemis45.getIsInSeriesConferenceFinal().booleanValue()) ? null : westSemis45;
        } else {
            westSemis1845 = westSemis18;
        }
        if (westSemis27 == null || !westSemis27.getIsInSeriesConferenceFinal().booleanValue()) {
            westSemis2736 = (westSemis36 == null || !westSemis36.getIsInSeriesConferenceFinal().booleanValue()) ? null : westSemis36;
        } else {
            westSemis2736 = westSemis27;
        }
        List<MatchPlayoffs> matchPlayoffsList = new ArrayList<>();
        createMatchPlayoffs(matchPlayoffsList, eastSemis1845, eastSemis2736, 8);
        createMatchPlayoffs(matchPlayoffsList, westSemis1845, westSemis2736, 8);
        Collections.sort(matchPlayoffsList, new MatchPlayoffsComparator());
        return matchPlayoffsList;
    }

    private List<MatchPlayoffs> getFinalMatch(List<Playoffs> playoffsList) {
        Playoffs eastSemis18;
        Playoffs eastSemis27;
        Playoffs eastSemis36;
        Playoffs eastSemis45;
        Playoffs westSemis18;
        Playoffs westSemis27;
        Playoffs westSemis36;
        Playoffs westSemis45;
        Playoffs eastSemis1845;
        Playoffs eastSemis2736;
        Playoffs westSemis1845;
        Playoffs westSemis2736;
        Playoffs eastConference;
        Playoffs westConference;
        Playoffs eastTeam1 = getPlayoffs(playoffsList, 1, 1);
        Playoffs eastTeam2 = getPlayoffs(playoffsList, 1, 2);
        Playoffs eastTeam3 = getPlayoffs(playoffsList, 1, 3);
        Playoffs eastTeam4 = getPlayoffs(playoffsList, 1, 4);
        Playoffs eastTeam5 = getPlayoffs(playoffsList, 1, 5);
        Playoffs eastTeam6 = getPlayoffs(playoffsList, 1, 6);
        Playoffs eastTeam7 = getPlayoffs(playoffsList, 1, 7);
        Playoffs eastTeam8 = getPlayoffs(playoffsList, 1, 8);
        Playoffs westTeam1 = getPlayoffs(playoffsList, 2, 1);
        Playoffs westTeam2 = getPlayoffs(playoffsList, 2, 2);
        Playoffs westTeam3 = getPlayoffs(playoffsList, 2, 3);
        Playoffs westTeam4 = getPlayoffs(playoffsList, 2, 4);
        Playoffs westTeam5 = getPlayoffs(playoffsList, 2, 5);
        Playoffs westTeam6 = getPlayoffs(playoffsList, 2, 6);
        Playoffs westTeam7 = getPlayoffs(playoffsList, 2, 7);
        Playoffs westTeam8 = getPlayoffs(playoffsList, 2, 8);
        if (eastTeam1 == null || !eastTeam1.getIsInSeriesSemis().booleanValue()) {
            eastSemis18 = (eastTeam8 == null || !eastTeam8.getIsInSeriesSemis().booleanValue()) ? null : eastTeam8;
        } else {
            eastSemis18 = eastTeam1;
        }
        if (eastTeam2 == null || !eastTeam2.getIsInSeriesSemis().booleanValue()) {
            eastSemis27 = (eastTeam7 == null || !eastTeam7.getIsInSeriesSemis().booleanValue()) ? null : eastTeam7;
        } else {
            eastSemis27 = eastTeam2;
        }
        if (eastTeam3 == null || !eastTeam3.getIsInSeriesSemis().booleanValue()) {
            eastSemis36 = (eastTeam6 == null || !eastTeam6.getIsInSeriesSemis().booleanValue()) ? null : eastTeam6;
        } else {
            eastSemis36 = eastTeam3;
        }
        if (eastTeam4 == null || !eastTeam4.getIsInSeriesSemis().booleanValue()) {
            eastSemis45 = (eastTeam5 == null || !eastTeam5.getIsInSeriesSemis().booleanValue()) ? null : eastTeam5;
        } else {
            eastSemis45 = eastTeam4;
        }
        if (westTeam1 == null || !westTeam1.getIsInSeriesSemis().booleanValue()) {
            westSemis18 = (westTeam8 == null || !westTeam8.getIsInSeriesSemis().booleanValue()) ? null : westTeam8;
        } else {
            westSemis18 = westTeam1;
        }
        if (westTeam2 == null || !westTeam2.getIsInSeriesSemis().booleanValue()) {
            westSemis27 = (westTeam7 == null || !westTeam7.getIsInSeriesSemis().booleanValue()) ? null : westTeam7;
        } else {
            westSemis27 = westTeam2;
        }
        if (westTeam3 == null || !westTeam3.getIsInSeriesSemis().booleanValue()) {
            westSemis36 = (westTeam6 == null || !westTeam6.getIsInSeriesSemis().booleanValue()) ? null : westTeam6;
        } else {
            westSemis36 = westTeam3;
        }
        if (westTeam4 == null || !westTeam4.getIsInSeriesSemis().booleanValue()) {
            westSemis45 = (westTeam5 == null || !westTeam5.getIsInSeriesSemis().booleanValue()) ? null : westTeam5;
        } else {
            westSemis45 = westTeam4;
        }
        if (eastSemis18 == null || !eastSemis18.getIsInSeriesConferenceFinal().booleanValue()) {
            eastSemis1845 = (eastSemis45 == null || !eastSemis45.getIsInSeriesConferenceFinal().booleanValue()) ? null : eastSemis45;
        } else {
            eastSemis1845 = eastSemis18;
        }
        if (eastSemis27 == null || !eastSemis27.getIsInSeriesConferenceFinal().booleanValue()) {
            eastSemis2736 = (eastSemis36 == null || !eastSemis36.getIsInSeriesConferenceFinal().booleanValue()) ? null : eastSemis36;
        } else {
            eastSemis2736 = eastSemis27;
        }
        if (westSemis18 == null || !westSemis18.getIsInSeriesConferenceFinal().booleanValue()) {
            westSemis1845 = (westSemis45 == null || !westSemis45.getIsInSeriesConferenceFinal().booleanValue()) ? null : westSemis45;
        } else {
            westSemis1845 = westSemis18;
        }
        if (westSemis27 == null || !westSemis27.getIsInSeriesConferenceFinal().booleanValue()) {
            westSemis2736 = (westSemis36 == null || !westSemis36.getIsInSeriesConferenceFinal().booleanValue()) ? null : westSemis36;
        } else {
            westSemis2736 = westSemis27;
        }
        if (eastSemis1845 == null || !eastSemis1845.getIsInSeriesWorldFinal().booleanValue()) {
            eastConference = (eastSemis2736 == null || !eastSemis2736.getIsInSeriesWorldFinal().booleanValue()) ? null : eastSemis2736;
        } else {
            eastConference = eastSemis1845;
        }
        if (westSemis1845 == null || !westSemis1845.getIsInSeriesWorldFinal().booleanValue()) {
            westConference = (westSemis2736 == null || !westSemis2736.getIsInSeriesWorldFinal().booleanValue()) ? null : westSemis2736;
        } else {
            westConference = westSemis1845;
        }
        List<MatchPlayoffs> matchPlayoffsList = new ArrayList<>();
        createMatchPlayoffs(matchPlayoffsList, eastConference, westConference, 12);
        Collections.sort(matchPlayoffsList, new MatchPlayoffsComparator());
        return matchPlayoffsList;
    }

    private void createMatchPlayoffs(List<MatchPlayoffs> matchPlayoffsList, Playoffs teamA, Playoffs teamB, int modifier) {
        MatchPlayoffs matchPlayoffs = new MatchPlayoffs(getHomeActivity());
        Playoffs localTeam = null;
        Playoffs visitorTeam = null;
        if (teamA != null && teamB != null) {
            if (teamA.getGamesWon().intValue() > teamB.getGamesWon().intValue()) {
                localTeam = teamA;
                visitorTeam = teamB;
            } else if (teamA.getGamesWon().intValue() < teamB.getGamesWon().intValue()) {
                localTeam = teamB;
                visitorTeam = teamA;
            } else if (teamA.getPointsDiff().intValue() > teamB.getPointsDiff().intValue()) {
                localTeam = teamA;
                visitorTeam = teamB;
            } else if (teamA.getPointsDiff().intValue() >= teamB.getPointsDiff().intValue() && teamA.getPointsScored().intValue() >= teamB.getPointsScored().intValue()) {
                localTeam = teamA;
                visitorTeam = teamB;
            } else {
                localTeam = teamB;
                visitorTeam = teamA;
            }
        }
        if (localTeam != null) {
            matchPlayoffs.setTeamLocal(localTeam.getTeam());
            matchPlayoffs.setTeamLocalPositionConference(localTeam.getPosition());
            int seriesGamesWon = localTeam.getSeriesGamesWon().intValue() - modifier;
            if (seriesGamesWon > 4) {
                seriesGamesWon = 4;
            }
            matchPlayoffs.setResultLocal(Integer.valueOf(seriesGamesWon));
            if (!localTeam.getIsInSeriesWorldFinal().booleanValue()) {
                matchPlayoffs.setConference(matchPlayoffs.getTeamLocal().getConference());
            }
        }
        if (visitorTeam != null) {
            matchPlayoffs.setTeamVisitor(visitorTeam.getTeam());
            matchPlayoffs.setTeamVisitorPositionConference(visitorTeam.getPosition());
            int seriesGamesWon2 = visitorTeam.getSeriesGamesWon().intValue() - modifier;
            matchPlayoffs.setResultVisitor(Integer.valueOf(seriesGamesWon2 <= 4 ? seriesGamesWon2 : 4));
            if (!visitorTeam.getIsInSeriesWorldFinal().booleanValue()) {
                matchPlayoffs.setConference(matchPlayoffs.getTeamLocal().getConference());
            }
        }
        if (localTeam != null || visitorTeam != null) {
            matchPlayoffsList.add(matchPlayoffs);
        }
    }

    private static Playoffs getPlayoffs(List<Playoffs> list, int conference, int position) {
        for (Playoffs playoffs : list) {
            if (playoffs.getConference().intValue() == conference && playoffs.getPosition().intValue() == position) {
                return playoffs;
            }
        }
        return null;
    }
}
