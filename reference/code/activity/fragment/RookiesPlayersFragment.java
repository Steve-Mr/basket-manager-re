package com.blank.bm15.activity.fragment;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
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
import com.blank.bm15.activity.HomeActivity;
import com.blank.bm15.activity.adapter.AdapterPlayerList;
import com.blank.bm15.activity.base.BaseActivity;
import com.blank.bm15.activity.base.BaseFragment;
import com.blank.bm15.dao.BlankDao;
import com.blank.bm15.dao.utils.BlankSharedPreferences;
import com.blank.bm15.model.comparator.PlayerComparator;
import com.blank.bm15.model.object.crud.Player;
import com.blank.bm15.model.util.Util;
import com.blank.bm15pro.R;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* loaded from: classes.dex */
public class RookiesPlayersFragment extends BaseFragment {
    private static final String FILTER_SHARED_PREFERENCE = "FILTER_ROOKIES";

    public static final RookiesPlayersFragment newInstance(int fragmentLayout) {
        RookiesPlayersFragment fragment = new RookiesPlayersFragment();
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
        int orderBy = BlankSharedPreferences.getInt(getHomeActivity(), FILTER_SHARED_PREFERENCE, 0);
        Button button = (Button) this.rootView.findViewById(R.id.fragmentTop100ButtonFilter);
        if (orderBy == 0) {
            button.setText(getString(R.string.button_filter));
            button.setBackgroundColor(getResources().getColor(R.color.holo_blue_light));
        } else {
            button.setText(String.valueOf(getString(R.string.button_filter_by)) + ": " + Util.getLongPositionString(getHomeActivity(), Integer.valueOf(orderBy)));
            button.setBackgroundColor(getResources().getColor(R.color.holo_red_dark));
        }
        button.setOnClickListener(new View.OnClickListener() { // from class: com.blank.bm15.activity.fragment.RookiesPlayersFragment.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                AlertDialog.Builder builder = new AlertDialog.Builder(RookiesPlayersFragment.this.getHomeActivity());
                LayoutInflater inflater = RookiesPlayersFragment.this.getHomeActivity().getLayoutInflater();
                View dialogView = inflater.inflate(R.layout.dialog_team_players, (ViewGroup) null);
                TextView title = (TextView) dialogView.findViewById(R.id.dialogTeamPlayersTextViewTitle);
                title.setText(RookiesPlayersFragment.this.getString(R.string.button_filter_by));
                builder.setView(dialogView).setPositiveButton(RookiesPlayersFragment.this.getString(R.string.button_remove), new DialogInterface.OnClickListener() { // from class: com.blank.bm15.activity.fragment.RookiesPlayersFragment.1.1
                    @Override // android.content.DialogInterface.OnClickListener
                    public void onClick(DialogInterface dialog, int id) {
                        BlankSharedPreferences.setInt(RookiesPlayersFragment.this.getHomeActivity(), RookiesPlayersFragment.FILTER_SHARED_PREFERENCE, 0);
                        dialog.cancel();
                        RookiesPlayersFragment.this.create();
                    }
                }).setNegativeButton(RookiesPlayersFragment.this.getString(R.string.button_cancel), new DialogInterface.OnClickListener() { // from class: com.blank.bm15.activity.fragment.RookiesPlayersFragment.1.2
                    @Override // android.content.DialogInterface.OnClickListener
                    public void onClick(DialogInterface dialog, int id) {
                        dialog.cancel();
                    }
                });
                List<String> orderTypes = new ArrayList<>();
                orderTypes.add(RookiesPlayersFragment.this.getString(R.string.position_point_guard));
                orderTypes.add(RookiesPlayersFragment.this.getString(R.string.position_shooting_guard));
                orderTypes.add(RookiesPlayersFragment.this.getString(R.string.position_small_forward));
                orderTypes.add(RookiesPlayersFragment.this.getString(R.string.position_power_forward));
                orderTypes.add(RookiesPlayersFragment.this.getString(R.string.position_center));
                ListView listView = (ListView) dialogView.findViewById(R.id.dialogTeamPlayersListViewList);
                ArrayAdapter<String> adapter = new ArrayAdapter<>(RookiesPlayersFragment.this.getHomeActivity(), android.R.layout.simple_list_item_1, orderTypes);
                listView.setAdapter((ListAdapter) adapter);
                listView.setOnItemClickListener(new AdapterView.OnItemClickListener() { // from class: com.blank.bm15.activity.fragment.RookiesPlayersFragment.1.3
                    @Override // android.widget.AdapterView.OnItemClickListener
                    public void onItemClick(AdapterView<?> arg0, View arg1, int position, long arg3) {
                        BlankSharedPreferences.setInt(RookiesPlayersFragment.this.getHomeActivity(), RookiesPlayersFragment.FILTER_SHARED_PREFERENCE, position + 1);
                        RookiesPlayersFragment.this.getHomeActivity().alertDialog.cancel();
                        RookiesPlayersFragment.this.create();
                    }
                });
                RookiesPlayersFragment.this.getHomeActivity().alertDialog = builder.create();
                RookiesPlayersFragment.this.getHomeActivity().alertDialog.show();
            }
        });
        final ListView listView = (ListView) this.rootView.findViewById(R.id.fragmentTop100ListViewPlayers);
        listView.setAdapter((ListAdapter) new AdapterPlayerList(getHomeActivity(), R.layout.spinner_player, getPlayers(orderBy), Boolean.TRUE.booleanValue()));
        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() { // from class: com.blank.bm15.activity.fragment.RookiesPlayersFragment.2
            @Override // android.widget.AdapterView.OnItemClickListener
            public void onItemClick(AdapterView<?> arg0, View arg1, int position, long arg3) {
                Player player = (Player) listView.getItemAtPosition(position);
                if (player.getTeam().getId() != null) {
                    BaseActivity.addNavigation(RookiesPlayersFragment.this.getHomeActivity(), 11, player.getId());
                    RookiesPlayersFragment.this.getHomeActivity().startActivity(new Intent(RookiesPlayersFragment.this.getHomeActivity(), (Class<?>) HomeActivity.class));
                }
            }
        });
    }

    private List<Player> getPlayers(int orderBy) {
        Player filter = new Player(getHomeActivity());
        filter.setGame(getGame());
        filter.setYearsExperience(0);
        filter.setPositionFirst(orderBy == 0 ? null : Integer.valueOf(orderBy));
        List<Player> playerList = BlankDao.getSome(filter);
        Collections.sort(playerList, new PlayerComparator(1, -1));
        return playerList;
    }
}
