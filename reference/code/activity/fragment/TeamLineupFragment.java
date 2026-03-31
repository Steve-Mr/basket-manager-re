package com.blank.bm15.activity.fragment;

import android.annotation.SuppressLint;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.ListAdapter;
import android.widget.ListView;
import com.blank.bm15.activity.adapter.AdapterPlayerList;
import com.blank.bm15.activity.adapter.SeparatedListAdapter;
import com.blank.bm15.activity.base.BaseActivity;
import com.blank.bm15.activity.base.BaseFragment;
import com.blank.bm15.dao.BlankDao;
import com.blank.bm15.dao.utils.BlankObj;
import com.blank.bm15.model.comparator.PlayerComparator;
import com.blank.bm15.model.core.Lineup;
import com.blank.bm15.model.object.crud.Navigation;
import com.blank.bm15.model.object.crud.Player;
import com.blank.bm15.model.object.crud.Team;
import com.blank.bm15pro.R;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* loaded from: classes.dex */
public class TeamLineupFragment extends BaseFragment {
    public static final TeamLineupFragment newInstance(int fragmentLayout) {
        TeamLineupFragment fragment = new TeamLineupFragment();
        Bundle args = new Bundle(2);
        args.putInt(FRAGMENT_LAYOUT, fragmentLayout);
        args.putBoolean(NAVIGATION_MODE_NULL, Boolean.TRUE.booleanValue());
        fragment.setArguments(args);
        return fragment;
    }

    @Override // com.blank.bm15.activity.base.BaseFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        createPage();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void createPage() {
        Navigation navigation = BaseActivity.getNavigation(getHomeActivity());
        final Team team = new Team(getHomeActivity());
        team.setId(navigation.getIdObject());
        BlankDao.loadById(team);
        TeamAllFragments.loadHeader(getHomeActivity(), this.rootView, team);
        Button button = (Button) this.rootView.findViewById(R.id.fragmentTeamLineupButtonTitularPointGuard);
        button.setContentDescription(BlankObj.toString(1));
        setTextButton(team, button, Boolean.TRUE);
        Button button2 = (Button) this.rootView.findViewById(R.id.fragmentTeamLineupButtonTitularShootingGuard);
        button2.setContentDescription(BlankObj.toString(2));
        setTextButton(team, button2, Boolean.TRUE);
        Button button3 = (Button) this.rootView.findViewById(R.id.fragmentTeamLineupButtonTitularSmallForward);
        button3.setContentDescription(BlankObj.toString(3));
        setTextButton(team, button3, Boolean.TRUE);
        Button button4 = (Button) this.rootView.findViewById(R.id.fragmentTeamLineupButtonTitularPowerForward);
        button4.setContentDescription(BlankObj.toString(4));
        setTextButton(team, button4, Boolean.TRUE);
        Button button5 = (Button) this.rootView.findViewById(R.id.fragmentTeamLineupButtonTitularCenter);
        button5.setContentDescription(BlankObj.toString(5));
        setTextButton(team, button5, Boolean.TRUE);
        Button button6 = (Button) this.rootView.findViewById(R.id.fragmentTeamLineupButtonReservePointGuard);
        button6.setContentDescription(BlankObj.toString(1));
        setTextButton(team, button6, Boolean.FALSE);
        Button button7 = (Button) this.rootView.findViewById(R.id.fragmentTeamLineupButtonReserveShootingGuard);
        button7.setContentDescription(BlankObj.toString(2));
        setTextButton(team, button7, Boolean.FALSE);
        Button button8 = (Button) this.rootView.findViewById(R.id.fragmentTeamLineupButtonReserveSmallForward);
        button8.setContentDescription(BlankObj.toString(3));
        setTextButton(team, button8, Boolean.FALSE);
        Button button9 = (Button) this.rootView.findViewById(R.id.fragmentTeamLineupButtonReservePowerForward);
        button9.setContentDescription(BlankObj.toString(4));
        setTextButton(team, button9, Boolean.FALSE);
        Button button10 = (Button) this.rootView.findViewById(R.id.fragmentTeamLineupButtonReserveCenter);
        button10.setContentDescription(BlankObj.toString(5));
        setTextButton(team, button10, Boolean.FALSE);
        ((Button) this.rootView.findViewById(R.id.fragmentTeamLineupButtonAuto)).setOnClickListener(new View.OnClickListener() { // from class: com.blank.bm15.activity.fragment.TeamLineupFragment.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                Lineup.setBetterLineup(team);
                TeamLineupFragment.this.createPage();
            }
        });
        ((Button) this.rootView.findViewById(R.id.fragmentTeamLineupButtonNone)).setOnClickListener(new View.OnClickListener() { // from class: com.blank.bm15.activity.fragment.TeamLineupFragment.2
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                Lineup.removeAll(team, Boolean.TRUE);
                TeamLineupFragment.this.createPage();
            }
        });
    }

    private void setTextButton(final Team team, final Button button, Boolean isTitular) {
        Player player;
        int position = Integer.valueOf(BlankObj.toString(button.getContentDescription())).intValue();
        if (isTitular.booleanValue()) {
            player = team.getTactic().getTitularPlayer(position);
            button.setOnClickListener(new View.OnClickListener() { // from class: com.blank.bm15.activity.fragment.TeamLineupFragment.3
                @Override // android.view.View.OnClickListener
                public void onClick(View v) {
                    TeamLineupFragment.this.onClickLineupPlayers(team, button, Boolean.TRUE);
                }
            });
        } else {
            player = team.getTactic().getReservePlayer(position);
            button.setOnClickListener(new View.OnClickListener() { // from class: com.blank.bm15.activity.fragment.TeamLineupFragment.4
                @Override // android.view.View.OnClickListener
                public void onClick(View v) {
                    TeamLineupFragment.this.onClickLineupPlayers(team, button, Boolean.FALSE);
                }
            });
        }
        if (player != null && player.getId() != null) {
            button.setText(String.valueOf(player.getShortName()) + " (" + BlankObj.toInteger(player.getAverageSkillAll()).toString() + ")");
        } else if (isTitular.booleanValue()) {
            button.setText(team.getContext().getString(R.string.team_titular));
        } else {
            button.setText(team.getContext().getString(R.string.team_reserve));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    @SuppressLint({"InflateParams"})
    public void onClickLineupPlayers(final Team team, Button button, final Boolean isTitular) {
        final int matchPosition = Integer.valueOf(BlankObj.toString(button.getContentDescription())).intValue();
        AlertDialog.Builder builder = new AlertDialog.Builder(getHomeActivity());
        LayoutInflater inflater = getHomeActivity().getLayoutInflater();
        View dialogView = inflater.inflate(R.layout.dialog_team_players, (ViewGroup) null);
        builder.setView(dialogView).setPositiveButton(getString(R.string.button_remove), new DialogInterface.OnClickListener() { // from class: com.blank.bm15.activity.fragment.TeamLineupFragment.5
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int id) {
                if (isTitular.booleanValue()) {
                    team.getTactic().setTitularPosition(new Player(team.getContext()), matchPosition);
                } else {
                    team.getTactic().setReservePosition(new Player(team.getContext()), matchPosition);
                }
                BlankDao.saveOrUpdate(team.getTactic());
                TeamLineupFragment.this.createPage();
            }
        }).setNegativeButton(getString(R.string.button_cancel), new DialogInterface.OnClickListener() { // from class: com.blank.bm15.activity.fragment.TeamLineupFragment.6
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int id) {
                dialog.cancel();
            }
        });
        final ListView listView = (ListView) dialogView.findViewById(R.id.dialogTeamPlayersListViewList);
        listView.setAdapter((ListAdapter) getAdapter(team, matchPosition));
        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() { // from class: com.blank.bm15.activity.fragment.TeamLineupFragment.7
            @Override // android.widget.AdapterView.OnItemClickListener
            public void onItemClick(AdapterView<?> arg0, View arg1, int position, long arg3) {
                Player player = (Player) listView.getItemAtPosition(position);
                if (player.getIsTitular().booleanValue()) {
                    team.getTactic().setTitularPosition(new Player(team.getContext()), team.getTactic().getTitularPosition(player).intValue());
                } else if (player.getIsReserve().booleanValue()) {
                    team.getTactic().setReservePosition(new Player(team.getContext()), team.getTactic().getReservePosition(player).intValue());
                }
                if (isTitular.booleanValue()) {
                    team.getTactic().setTitularPosition(player, matchPosition);
                } else {
                    team.getTactic().setReservePosition(player, matchPosition);
                }
                BlankDao.saveOrUpdate(team.getTactic());
                TeamLineupFragment.this.createPage();
                TeamLineupFragment.this.getHomeActivity().alertDialog.cancel();
            }
        });
        getHomeActivity().alertDialog = builder.create();
        getHomeActivity().alertDialog.show();
    }

    private SeparatedListAdapter getAdapter(Team team, int matchPosition) {
        List<Player> positionFirstList = new ArrayList<>();
        List<Player> positionSecondList = new ArrayList<>();
        List<Player> positionOtherList = new ArrayList<>();
        Collections.sort(team.getTactic().getPlayers(), new PlayerComparator(1, -1));
        for (Player player : team.getTactic().getPlayers()) {
            if (player.getPositionFirst().intValue() == matchPosition) {
                positionFirstList.add(player);
            } else if (player.getPositionSecond().intValue() == matchPosition) {
                positionSecondList.add(player);
            } else {
                positionOtherList.add(player);
            }
        }
        SeparatedListAdapter separatedAdapter = new SeparatedListAdapter(getHomeActivity());
        if (!positionFirstList.isEmpty()) {
            AdapterPlayerList adapter = new AdapterPlayerList(getHomeActivity(), R.layout.spinner_player, positionFirstList, Boolean.FALSE.booleanValue());
            separatedAdapter.addSection(getHomeActivity().getString(R.string.team_position_first), adapter);
        }
        if (!positionSecondList.isEmpty()) {
            AdapterPlayerList adapter2 = new AdapterPlayerList(getHomeActivity(), R.layout.spinner_player, positionSecondList, Boolean.FALSE.booleanValue());
            separatedAdapter.addSection(getHomeActivity().getString(R.string.team_position_second), adapter2);
        }
        if (!positionOtherList.isEmpty()) {
            AdapterPlayerList adapter3 = new AdapterPlayerList(getHomeActivity(), R.layout.spinner_player, positionOtherList, Boolean.FALSE.booleanValue());
            separatedAdapter.addSection(getHomeActivity().getString(R.string.team_position_other), adapter3);
        }
        return separatedAdapter;
    }
}
