package com.blank.bm15.activity.fragment;

import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ImageView;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.TextView;
import com.blank.bm15.activity.HomeActivity;
import com.blank.bm15.activity.adapter.AdapterFinanceList;
import com.blank.bm15.activity.base.BaseFragment;
import com.blank.bm15.model.object.crud.Player;
import com.blank.bm15.model.object.crud.Team;
import com.blank.bm15.model.object.other.Finance;
import com.blank.bm15.model.util.Util;
import com.blank.bm15pro.R;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class FinancesFragment extends BaseFragment {
    public static final FinancesFragment newInstance(int fragmentLayout, Integer navigationMode) {
        FinancesFragment fragment = new FinancesFragment();
        Bundle args = new Bundle(2);
        args.putInt(FRAGMENT_LAYOUT, fragmentLayout);
        args.putInt(NAVIGATION_MODE, navigationMode.intValue());
        fragment.setArguments(args);
        return fragment;
    }

    @Override // com.blank.bm15.activity.base.BaseFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        getGame().getUserTeam().getTactic().reloadPlayers();
        loadHeader(getHomeActivity(), this.rootView, getGame().getUserTeam());
        Finance total = null;
        List<Finance> financeList = new ArrayList<>();
        for (Player player : getGame().getUserTeam().getTactic().getPlayers()) {
            if (total == null) {
                financeList.add(new Finance(player));
                total = new Finance(player);
            } else {
                total.addPlayer(player);
            }
            financeList.add(new Finance(player));
        }
        financeList.add(total);
        ListView listView = (ListView) this.rootView.findViewById(R.id.fragmentTeamStatisticsListViewTeam);
        listView.setAdapter((ListAdapter) new AdapterFinanceList(getHomeActivity(), R.layout.spinner_finance, financeList));
        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() { // from class: com.blank.bm15.activity.fragment.FinancesFragment.1
            @Override // android.widget.AdapterView.OnItemClickListener
            public void onItemClick(AdapterView<?> arg0, View arg1, int position, long arg3) {
            }
        });
    }

    private void loadHeader(HomeActivity activity, View rootView, Team team) {
        TextView textView = (TextView) rootView.findViewById(R.id.teamTextViewName);
        textView.setText(team.getFullName());
        TextView textView2 = (TextView) rootView.findViewById(R.id.teamTextViewConferenceDivision);
        String confereceAndDivision = String.valueOf(Util.getConference(activity, team.getConference())) + " - " + Util.getDivision(activity, team.getDivision());
        textView2.setText(confereceAndDivision);
        Integer salaryAvailable = Integer.valueOf(team.getSalaryCap().intValue() - team.getTeamSalary(null).intValue());
        TextView textView3 = (TextView) rootView.findViewById(R.id.teamTextViewTitular);
        textView3.setText(getHomeActivity().getString(R.string.spinner_team_salary_cap));
        TextView textView4 = (TextView) rootView.findViewById(R.id.teamTextViewAverageTitularsValue);
        textView4.setText(Util.formatSalary(team.getSalaryCap()));
        TextView textView5 = (TextView) rootView.findViewById(R.id.teamTextViewReserve);
        textView5.setText(getHomeActivity().getString(R.string.spinner_team_salary_current));
        TextView textView6 = (TextView) rootView.findViewById(R.id.teamTextViewAverageReservesValue);
        textView6.setText(Util.formatSalary(team.getTeamSalary(null)));
        TextView textView7 = (TextView) rootView.findViewById(R.id.teamTextViewRemain);
        textView7.setText(getHomeActivity().getString(R.string.spinner_team_salary_available));
        TextView textView8 = (TextView) rootView.findViewById(R.id.teamTextViewAverageRemainsValue);
        textView8.setText(Util.formatSalary(salaryAvailable));
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
