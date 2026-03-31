package com.blank.bm15.activity.fragment;

import android.os.Bundle;
import android.view.View;
import android.widget.ListAdapter;
import android.widget.ListView;
import com.blank.bm15.activity.adapter.AdapterChallengeList;
import com.blank.bm15.activity.base.BaseFragment;
import com.blank.bm15.dao.BlankDao;
import com.blank.bm15.model.comparator.ChallengeComparator;
import com.blank.bm15.model.object.crud.Challenge;
import com.blank.bm15.model.object.crud.Game;
import com.blank.bm15.model.util.Alert;
import com.blank.bm15pro.R;
import java.util.Collections;
import java.util.List;

/* loaded from: classes.dex */
public class ChallengesFragment extends BaseFragment {
    public static final ChallengesFragment newInstance(int fragmentLayout, Integer navigationMode) {
        ChallengesFragment fragment = new ChallengesFragment();
        Bundle args = new Bundle(2);
        args.putInt(FRAGMENT_LAYOUT, fragmentLayout);
        args.putInt(NAVIGATION_MODE, navigationMode.intValue());
        fragment.setArguments(args);
        return fragment;
    }

    @Override // com.blank.bm15.activity.base.BaseFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        List<Challenge> challengeList = BlankDao.getAll(new Challenge(getHomeActivity()));
        Collections.sort(challengeList, new ChallengeComparator(0, 1));
        ListView listView = (ListView) this.rootView.findViewById(R.id.fragmentLisView);
        listView.setAdapter((ListAdapter) new AdapterChallengeList(getHomeActivity(), R.layout.spinner_drawer_item, challengeList));
        Challenge filter = new Challenge(getHomeActivity());
        filter.setAcquired(Boolean.TRUE);
        List<Challenge> challengeAcquiredList = BlankDao.getSome(filter);
        if (challengeAcquiredList.isEmpty()) {
            Alert.showInfoDialog(getHomeActivity(), Integer.valueOf(R.string.notice_challenge));
        }
    }

    public static void addChallenge(Game game) {
        Challenge filter = new Challenge(game.getContext());
        List<Challenge> challengeList = BlankDao.getAll(filter);
        for (Challenge challenge : challengeList) {
            if (challenge.getTeamName().equals(game.getUserTeam().getName())) {
                if (!challenge.getAcquired().booleanValue()) {
                    challenge.setAcquired(Boolean.TRUE);
                    challenge.setSeason(game.getCurrentSeason());
                } else if (challenge.getSeason() != null && challenge.getSeason().intValue() > game.getCurrentSeason().intValue()) {
                    challenge.setAcquired(Boolean.TRUE);
                    challenge.setSeason(game.getCurrentSeason());
                }
            }
        }
        BlankDao.saveOrUpdateAll(challengeList);
    }
}
