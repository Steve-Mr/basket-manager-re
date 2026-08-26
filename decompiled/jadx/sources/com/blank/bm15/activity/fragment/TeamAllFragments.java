package com.blank.bm15.activity.fragment;

import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import com.blank.bm15.activity.HomeActivity;
import com.blank.bm15.activity.base.BaseActivity;
import com.blank.bm15.activity.base.BaseFragment;
import com.blank.bm15.activity.base.BaseTabListener;
import com.blank.bm15.dao.utils.BlankObj;
import com.blank.bm15.model.object.crud.Navigation;
import com.blank.bm15.model.object.crud.Team;
import com.blank.bm15.model.util.Util;
import com.blank.bm15pro.R;

/* JADX INFO: loaded from: classes.dex */
public class TeamAllFragments extends BaseFragment {
    public static final TeamAllFragments newInstance(int fragmentLayout, Integer navigationMode) {
        TeamAllFragments fragment = new TeamAllFragments();
        Bundle args = new Bundle(2);
        args.putInt(FRAGMENT_LAYOUT, fragmentLayout);
        args.putInt(NAVIGATION_MODE, navigationMode.intValue());
        fragment.setArguments(args);
        return fragment;
    }

    @Override // com.blank.bm15.activity.base.BaseFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        this.fragmentTab1 = TeamSquadFragment.newInstance(R.layout.fragment_team_squad);
        this.fragmentTab2 = TeamLineupFragment.newInstance(R.layout.fragment_team_lineup);
        this.fragmentTab3 = TeamTacticFragment.newInstance(R.layout.fragment_team_tactic);
        this.fragmentTab4 = TeamStatisticsFragment.newInstance(R.layout.fragment_team_statistics);
        this.tab1 = getActionBar().newTab().setText(getHomeActivity().getString(R.string.team_tab_squad));
        this.tab2 = getActionBar().newTab().setText(getHomeActivity().getString(R.string.team_tab_lineup));
        this.tab3 = getActionBar().newTab().setText(getHomeActivity().getString(R.string.team_tab_tactic));
        this.tab4 = getActionBar().newTab().setText(getHomeActivity().getString(R.string.team_tab_statistic));
        this.tab1.setTabListener(new BaseTabListener(this.fragmentTab1));
        this.tab2.setTabListener(new BaseTabListener(this.fragmentTab2));
        this.tab3.setTabListener(new BaseTabListener(this.fragmentTab3));
        this.tab4.setTabListener(new BaseTabListener(this.fragmentTab4));
        Navigation navigation = BaseActivity.getNavigation(getHomeActivity());
        getActionBar().addTab(this.tab1);
        if (getGame() != null && getGame().getUserTeam() != null && getGame().getUserTeam().getId() != null && navigation != null && navigation.getIdObject() != null && getGame().getUserTeam().getId().intValue() == navigation.getIdObject().intValue()) {
            getActionBar().addTab(this.tab2);
            getActionBar().addTab(this.tab3);
        }
        getActionBar().addTab(this.tab4);
    }

    public static void loadHeader(HomeActivity activity, View rootView, Team team) {
        TextView textView = (TextView) rootView.findViewById(R.id.teamTextViewName);
        textView.setText(team.getFullName());
        TextView textView2 = (TextView) rootView.findViewById(R.id.teamTextViewConferenceDivision);
        String confereceAndDivision = String.valueOf(Util.getConference(activity, team.getConference())) + " - " + Util.getDivision(activity, team.getDivision());
        textView2.setText(confereceAndDivision);
        String text = "(" + activity.getString(R.string.spinner_team_average_attack) + "/" + activity.getString(R.string.spinner_team_average_defense) + ")  ";
        TextView textView3 = (TextView) rootView.findViewById(R.id.teamTextViewTitular);
        textView3.setText(String.valueOf(text) + activity.getString(R.string.team_titular));
        TextView textView4 = (TextView) rootView.findViewById(R.id.teamTextViewAverageTitularsValue);
        textView4.setText(String.valueOf(BlankObj.toInteger(team.getPlayersAverageTitularsAttack()).toString()) + "/" + BlankObj.toInteger(team.getPlayersAverageTitularsDefense()).toString());
        TextView textView5 = (TextView) rootView.findViewById(R.id.teamTextViewAverageReservesValue);
        textView5.setText(String.valueOf(BlankObj.toInteger(team.getPlayersAverageReservesAttack()).toString()) + "/" + BlankObj.toInteger(team.getPlayersAverageReservesDefense()).toString());
        TextView textView6 = (TextView) rootView.findViewById(R.id.teamTextViewAverageRemainsValue);
        textView6.setText(String.valueOf(BlankObj.toInteger(team.getPlayersAverageRemainsAttack()).toString()) + "/" + BlankObj.toInteger(team.getPlayersAverageRemainsDefense()).toString());
        int potential = team.getTeamAveragePotential().intValue();
        ImageView image = (ImageView) rootView.findViewById(R.id.teamImageViewAveragePotential);
        if (potential >= 9) {
            image.setImageDrawable(activity.getResources().getDrawable(R.drawable.star5));
            return;
        }
        if (potential >= 7) {
            image.setImageDrawable(activity.getResources().getDrawable(R.drawable.star4));
            return;
        }
        if (potential >= 5) {
            image.setImageDrawable(activity.getResources().getDrawable(R.drawable.star3));
        } else if (potential >= 3) {
            image.setImageDrawable(activity.getResources().getDrawable(R.drawable.star2));
        } else {
            image.setImageDrawable(activity.getResources().getDrawable(R.drawable.star1));
        }
    }
}
