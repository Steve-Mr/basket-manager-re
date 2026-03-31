package com.blank.bm15.activity.fragment;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.TextView;
import com.blank.bm15.activity.adapter.AdapterMatchResultList;
import com.blank.bm15.activity.base.BaseFragment;
import com.blank.bm15.dao.BlankDaoExtra;
import com.blank.bm15.model.comparator.MatchResultComparator;
import com.blank.bm15.model.object.crud.Game;
import com.blank.bm15.model.object.crud.MatchResult;
import com.blank.bm15pro.R;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* loaded from: classes.dex */
public class RookiesStatisticsFragment extends BaseFragment {
    private String textButton = null;
    private Integer orderBy = null;

    public static final RookiesStatisticsFragment newInstance(int fragmentLayout) {
        RookiesStatisticsFragment fragment = new RookiesStatisticsFragment();
        Bundle args = new Bundle(2);
        args.putInt(FRAGMENT_LAYOUT, fragmentLayout);
        args.putBoolean(NAVIGATION_MODE_NULL, Boolean.TRUE.booleanValue());
        fragment.setArguments(args);
        return fragment;
    }

    @Override // com.blank.bm15.activity.base.BaseFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        create();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void create() {
        Button button = (Button) this.rootView.findViewById(R.id.fragmentTop100ButtonFilter);
        if (this.textButton == null) {
            button.setText(getString(R.string.button_filter));
        } else {
            button.setText(String.valueOf(getString(R.string.button_filter_by)) + ": " + this.textButton);
        }
        button.setOnClickListener(new View.OnClickListener() { // from class: com.blank.bm15.activity.fragment.RookiesStatisticsFragment.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                AlertDialog.Builder builder = new AlertDialog.Builder(RookiesStatisticsFragment.this.getHomeActivity());
                LayoutInflater inflater = RookiesStatisticsFragment.this.getHomeActivity().getLayoutInflater();
                View dialogView = inflater.inflate(R.layout.dialog_team_players, (ViewGroup) null);
                TextView title = (TextView) dialogView.findViewById(R.id.dialogTeamPlayersTextViewTitle);
                title.setText(RookiesStatisticsFragment.this.getString(R.string.button_filter_by));
                builder.setView(dialogView).setPositiveButton(RookiesStatisticsFragment.this.getString(R.string.button_remove), new DialogInterface.OnClickListener() { // from class: com.blank.bm15.activity.fragment.RookiesStatisticsFragment.1.1
                    @Override // android.content.DialogInterface.OnClickListener
                    public void onClick(DialogInterface dialog, int id) {
                        RookiesStatisticsFragment.this.orderBy = null;
                        RookiesStatisticsFragment.this.textButton = null;
                        dialog.cancel();
                        RookiesStatisticsFragment.this.create();
                    }
                }).setNegativeButton(RookiesStatisticsFragment.this.getString(R.string.button_cancel), new DialogInterface.OnClickListener() { // from class: com.blank.bm15.activity.fragment.RookiesStatisticsFragment.1.2
                    @Override // android.content.DialogInterface.OnClickListener
                    public void onClick(DialogInterface dialog, int id) {
                        dialog.cancel();
                    }
                });
                List<String> orderTypes = new ArrayList<>();
                orderTypes.add(RookiesStatisticsFragment.this.getString(R.string.position_point_guard));
                orderTypes.add(RookiesStatisticsFragment.this.getString(R.string.position_shooting_guard));
                orderTypes.add(RookiesStatisticsFragment.this.getString(R.string.position_small_forward));
                orderTypes.add(RookiesStatisticsFragment.this.getString(R.string.position_power_forward));
                orderTypes.add(RookiesStatisticsFragment.this.getString(R.string.position_center));
                final ListView listView = (ListView) dialogView.findViewById(R.id.dialogTeamPlayersListViewList);
                ArrayAdapter<String> adapter = new ArrayAdapter<>(RookiesStatisticsFragment.this.getHomeActivity(), android.R.layout.simple_list_item_1, orderTypes);
                listView.setAdapter((ListAdapter) adapter);
                listView.setOnItemClickListener(new AdapterView.OnItemClickListener() { // from class: com.blank.bm15.activity.fragment.RookiesStatisticsFragment.1.3
                    @Override // android.widget.AdapterView.OnItemClickListener
                    public void onItemClick(AdapterView<?> arg0, View arg1, int position, long arg3) {
                        RookiesStatisticsFragment.this.textButton = (String) listView.getItemAtPosition(position);
                        RookiesStatisticsFragment.this.orderBy = Integer.valueOf(position + 1);
                        RookiesStatisticsFragment.this.getHomeActivity().alertDialog.cancel();
                        RookiesStatisticsFragment.this.create();
                    }
                });
                RookiesStatisticsFragment.this.getHomeActivity().alertDialog = builder.create();
                RookiesStatisticsFragment.this.getHomeActivity().alertDialog.show();
            }
        });
        ListView listView = (ListView) this.rootView.findViewById(R.id.fragmentTop100ListViewPlayers);
        listView.setAdapter((ListAdapter) getAdapter());
    }

    private AdapterMatchResultList getAdapter() {
        List<MatchResult> matchResultList = getStatisticList(getGame(), this.orderBy);
        matchResultList.add(0, new MatchResult(getHomeActivity()));
        return new AdapterMatchResultList(getHomeActivity(), R.layout.spinner_match_result, matchResultList, Boolean.TRUE);
    }

    public static List<MatchResult> getStatisticList(Game game, Integer position) {
        MatchResult filter = new MatchResult(game.getContext());
        filter.setGame(game);
        filter.getPlayer().setYearsExperience(0);
        filter.getPlayer().setPositionFirst(position);
        List<MatchResult> auxMatchResultList = BlankDaoExtra.getAllStatistics(filter);
        Collections.sort(auxMatchResultList, new MatchResultComparator(1, -1));
        List<MatchResult> matchResultList = new ArrayList<>();
        int i = 1;
        for (MatchResult matchResult : auxMatchResultList) {
            int i2 = i + 1;
            matchResult.setName(String.valueOf(i) + ".  " + matchResult.getName());
            matchResultList.add(matchResult);
            if (i2 > 100) {
                break;
            }
            i = i2;
        }
        return matchResultList;
    }

    public static String getRookieOfYearNewsBody(Game game) {
        List<MatchResult> matchResultList = getStatisticList(game, null);
        String body = "";
        int i = 0;
        for (MatchResult matchResult : matchResultList) {
            body = String.valueOf(body) + matchResult.getName() + " " + game.getContext().getString(R.string.of) + " " + matchResult.getPlayer().getTeam().getName() + "\n";
            i++;
            if (i == 3) {
                break;
            }
        }
        return body;
    }
}
