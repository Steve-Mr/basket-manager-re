package com.blank.bm15.activity;

import android.annotation.SuppressLint;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.TextView;
import com.blank.bm15.activity.adapter.AdapterPlayerList;
import com.blank.bm15.activity.adapter.AdapterSelectTeamList;
import com.blank.bm15.activity.adapter.SeparatedListAdapter;
import com.blank.bm15.activity.base.BaseActivity;
import com.blank.bm15.dao.BlankDao;
import com.blank.bm15.model.comparator.PlayerComparator;
import com.blank.bm15.model.object.crud.Player;
import com.blank.bm15.model.object.crud.Team;
import com.blank.bm15.model.util.Util;
import com.blank.bm15pro.R;
import java.util.Collections;
import java.util.List;

/* loaded from: classes.dex */
public class SelectTeamActivity extends BaseActivity {
    private AlertDialog dialog = null;

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.blank.bm15.activity.base.BaseActivity, android.app.Activity
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_select_team);
        createPage();
    }

    @SuppressLint({"InflateParams"})
    private void createPage() {
        if (getGame().getUserTeam().getId() != null) {
            startActivity(new Intent(this, (Class<?>) MainActivity.class));
        }
        final ListView listView = (ListView) findViewById(R.id.selectTeamListViewTeams);
        listView.setAdapter((ListAdapter) getAdapter());
        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() { // from class: com.blank.bm15.activity.SelectTeamActivity.1
            @Override // android.widget.AdapterView.OnItemClickListener
            public void onItemClick(AdapterView<?> arg0, View arg1, int position, long arg3) {
                final Team team = (Team) listView.getItemAtPosition(position);
                AlertDialog.Builder builder = new AlertDialog.Builder(SelectTeamActivity.this);
                LayoutInflater inflater = SelectTeamActivity.this.getLayoutInflater();
                View dialogView = inflater.inflate(R.layout.dialog_team_players, (ViewGroup) null);
                TextView textView = (TextView) dialogView.findViewById(R.id.dialogTeamPlayersTextViewTitle);
                textView.setText(String.format(SelectTeamActivity.this.getString(R.string.select_team_confirm_team), team.getFullName()));
                textView.setBackgroundColor(SelectTeamActivity.this.getResources().getColor(Util.getTeamColor(team)));
                builder.setView(dialogView).setPositiveButton(SelectTeamActivity.this.getString(R.string.button_accept), new DialogInterface.OnClickListener() { // from class: com.blank.bm15.activity.SelectTeamActivity.1.1
                    @Override // android.content.DialogInterface.OnClickListener
                    public void onClick(DialogInterface dialog, int id) {
                        SelectTeamActivity.this.getGame().setUserTeam(team);
                        BlankDao.saveOrUpdate(SelectTeamActivity.this.getGame());
                        SelectTeamActivity.this.startActivity(new Intent(SelectTeamActivity.this, (Class<?>) HomeActivity.class));
                    }
                }).setNegativeButton(SelectTeamActivity.this.getString(R.string.button_cancel), new DialogInterface.OnClickListener() { // from class: com.blank.bm15.activity.SelectTeamActivity.1.2
                    @Override // android.content.DialogInterface.OnClickListener
                    public void onClick(DialogInterface dialog, int id) {
                        dialog.cancel();
                    }
                });
                List<Player> players = team.getTactic().getPlayers();
                Collections.sort(players, new PlayerComparator(1, -1));
                ListView listView2 = (ListView) dialogView.findViewById(R.id.dialogTeamPlayersListViewList);
                listView2.setAdapter((ListAdapter) new AdapterPlayerList(SelectTeamActivity.this, R.layout.spinner_player, players, Boolean.FALSE.booleanValue()));
                SelectTeamActivity.this.dialog = builder.create();
                SelectTeamActivity.this.dialog.show();
            }
        });
    }

    private SeparatedListAdapter getAdapter() {
        Team filter = new Team(this);
        filter.setGame(getGame());
        String conferenceEast = Util.getConference(this, 1);
        String conferenceWest = Util.getConference(this, 2);
        SeparatedListAdapter separatedAdapter = new SeparatedListAdapter(this);
        filter.setDivision(1);
        AdapterSelectTeamList adapter = new AdapterSelectTeamList(this, R.layout.spinner_team, BlankDao.getSome(filter));
        separatedAdapter.addSection(String.valueOf(conferenceEast) + " - " + Util.getDivision(this, 1), adapter);
        filter.setDivision(2);
        AdapterSelectTeamList adapter2 = new AdapterSelectTeamList(this, R.layout.spinner_team, BlankDao.getSome(filter));
        separatedAdapter.addSection(String.valueOf(conferenceEast) + " - " + Util.getDivision(this, 2), adapter2);
        filter.setDivision(3);
        AdapterSelectTeamList adapter3 = new AdapterSelectTeamList(this, R.layout.spinner_team, BlankDao.getSome(filter));
        separatedAdapter.addSection(String.valueOf(conferenceEast) + " - " + Util.getDivision(this, 3), adapter3);
        filter.setDivision(4);
        AdapterSelectTeamList adapter4 = new AdapterSelectTeamList(this, R.layout.spinner_team, BlankDao.getSome(filter));
        separatedAdapter.addSection(String.valueOf(conferenceWest) + " - " + Util.getDivision(this, 4), adapter4);
        filter.setDivision(5);
        AdapterSelectTeamList adapter5 = new AdapterSelectTeamList(this, R.layout.spinner_team, BlankDao.getSome(filter));
        separatedAdapter.addSection(String.valueOf(conferenceWest) + " - " + Util.getDivision(this, 5), adapter5);
        filter.setDivision(6);
        AdapterSelectTeamList adapter6 = new AdapterSelectTeamList(this, R.layout.spinner_team, BlankDao.getSome(filter));
        separatedAdapter.addSection(String.valueOf(conferenceWest) + " - " + Util.getDivision(this, 6), adapter6);
        return separatedAdapter;
    }
}
