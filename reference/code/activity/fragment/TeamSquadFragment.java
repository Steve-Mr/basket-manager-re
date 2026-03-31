package com.blank.bm15.activity.fragment;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.TextView;
import com.blank.bm15.activity.HomeActivity;
import com.blank.bm15.activity.adapter.AdapterPlayerList;
import com.blank.bm15.activity.adapter.AdapterStringTextList;
import com.blank.bm15.activity.adapter.SeparatedListAdapter;
import com.blank.bm15.activity.base.BaseActivity;
import com.blank.bm15.activity.base.BaseFragment;
import com.blank.bm15.dao.BlankDao;
import com.blank.bm15.model.comparator.DraftRoundComparator;
import com.blank.bm15.model.comparator.PlayerComparator;
import com.blank.bm15.model.core.Lineup;
import com.blank.bm15.model.object.crud.DraftRound;
import com.blank.bm15.model.object.crud.Navigation;
import com.blank.bm15.model.object.crud.Player;
import com.blank.bm15.model.object.crud.Team;
import com.blank.bm15.model.object.other.StringText;
import com.blank.bm15.model.util.Alert;
import com.blank.bm15.model.util.Util;
import com.blank.bm15pro.R;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* loaded from: classes.dex */
public class TeamSquadFragment extends BaseFragment {
    public static final TeamSquadFragment newInstance(int fragmentLayout) {
        TeamSquadFragment fragment = new TeamSquadFragment();
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
        final ListView listView = (ListView) this.rootView.findViewById(R.id.fragmentTeamSquadListViewTeam);
        listView.setAdapter((ListAdapter) getAdapter(team));
        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() { // from class: com.blank.bm15.activity.fragment.TeamSquadFragment.1
            @Override // android.widget.AdapterView.OnItemClickListener
            public void onItemClick(AdapterView<?> arg0, View arg1, int position, long arg3) {
                Player player = (Player) listView.getItemAtPosition(position);
                BaseActivity.addNavigation(TeamSquadFragment.this.getHomeActivity(), 11, player.getId());
                TeamSquadFragment.this.getHomeActivity().startActivity(new Intent(TeamSquadFragment.this.getHomeActivity(), (Class<?>) HomeActivity.class));
            }
        });
        if (team.getId() != null && getGame().getUserTeam().getId() != null && team.getId().intValue() == getGame().getUserTeam().getId().intValue()) {
            listView.setOnItemLongClickListener(new AdapterView.OnItemLongClickListener() { // from class: com.blank.bm15.activity.fragment.TeamSquadFragment.2
                @Override // android.widget.AdapterView.OnItemLongClickListener
                public boolean onItemLongClick(AdapterView<?> arg0, View arg1, int position, long arg3) {
                    final Player selectedPlayer = (Player) listView.getItemAtPosition(position);
                    final int selectedPlayerMatchPosition = selectedPlayer.getPositionMatch().intValue();
                    final boolean selectedPlayerIsInLineup = selectedPlayer.getIsInLineup().booleanValue();
                    final boolean selectedPlayerIsTitular = selectedPlayer.getIsTitular().booleanValue();
                    AlertDialog.Builder builder = new AlertDialog.Builder(TeamSquadFragment.this.getHomeActivity());
                    LayoutInflater inflater = TeamSquadFragment.this.getHomeActivity().getLayoutInflater();
                    View dialogView = inflater.inflate(R.layout.dialog_team_players, (ViewGroup) null);
                    TextView title = (TextView) dialogView.findViewById(R.id.dialogTeamPlayersTextViewTitle);
                    title.setText(TeamSquadFragment.this.getString(R.string.team_positions));
                    builder.setView(dialogView).setNegativeButton(TeamSquadFragment.this.getString(R.string.button_cancel), new DialogInterface.OnClickListener() { // from class: com.blank.bm15.activity.fragment.TeamSquadFragment.2.1
                        @Override // android.content.DialogInterface.OnClickListener
                        public void onClick(DialogInterface dialog, int id) {
                            dialog.cancel();
                        }
                    });
                    if (selectedPlayerIsInLineup) {
                        String string = TeamSquadFragment.this.getString(R.string.button_remove);
                        final Team team2 = team;
                        builder.setPositiveButton(string, new DialogInterface.OnClickListener() { // from class: com.blank.bm15.activity.fragment.TeamSquadFragment.2.2
                            @Override // android.content.DialogInterface.OnClickListener
                            public void onClick(DialogInterface dialog, int id) {
                                if (selectedPlayerIsTitular) {
                                    team2.getTactic().setTitularPosition(new Player(team2.getContext()), selectedPlayerMatchPosition);
                                } else {
                                    team2.getTactic().setReservePosition(new Player(team2.getContext()), selectedPlayerMatchPosition);
                                }
                                BlankDao.saveOrUpdate(team2.getTactic());
                                TeamSquadFragment.this.createPage();
                            }
                        });
                    }
                    final ListView listView2 = (ListView) dialogView.findViewById(R.id.dialogTeamPlayersListViewList);
                    listView2.setAdapter((ListAdapter) TeamSquadFragment.this.getMatchPositions(selectedPlayer));
                    final Team team3 = team;
                    listView2.setOnItemClickListener(new AdapterView.OnItemClickListener() { // from class: com.blank.bm15.activity.fragment.TeamSquadFragment.2.3
                        @Override // android.widget.AdapterView.OnItemClickListener
                        public void onItemClick(AdapterView<?> arg02, View arg12, int position2, long arg32) {
                            Player auxPlayer;
                            StringText stringText = (StringText) listView2.getItemAtPosition(position2);
                            int newMatchPosition = stringText.getId().intValue();
                            boolean newMatchPositionIsTitular = newMatchPosition < 6;
                            if (!newMatchPositionIsTitular) {
                                newMatchPosition -= 5;
                            }
                            if (selectedPlayerIsInLineup) {
                                if (newMatchPositionIsTitular) {
                                    auxPlayer = team3.getTactic().getTitularPlayer(newMatchPosition);
                                } else {
                                    auxPlayer = team3.getTactic().getReservePlayer(newMatchPosition);
                                }
                                if (auxPlayer != null) {
                                    if (auxPlayer.getId().intValue() == selectedPlayer.getId().intValue()) {
                                        TeamSquadFragment.this.getHomeActivity().alertDialog.cancel();
                                    } else if (selectedPlayerIsTitular) {
                                        team3.getTactic().setTitularPosition(auxPlayer, selectedPlayerMatchPosition);
                                    } else if (selectedPlayer.getIsReserve().booleanValue()) {
                                        team3.getTactic().setReservePosition(auxPlayer, selectedPlayerMatchPosition);
                                    }
                                } else if (selectedPlayerIsTitular) {
                                    team3.getTactic().setTitularPosition(new Player(team3.getContext()), selectedPlayerMatchPosition);
                                } else {
                                    team3.getTactic().setReservePosition(new Player(team3.getContext()), selectedPlayerMatchPosition);
                                }
                            }
                            if (newMatchPositionIsTitular) {
                                team3.getTactic().setTitularPosition(selectedPlayer, newMatchPosition);
                            } else {
                                team3.getTactic().setReservePosition(selectedPlayer, newMatchPosition);
                            }
                            BlankDao.saveOrUpdate(team3.getTactic());
                            TeamSquadFragment.this.getHomeActivity().alertDialog.cancel();
                            TeamSquadFragment.this.createPage();
                        }
                    });
                    TeamSquadFragment.this.getHomeActivity().alertDialog = builder.create();
                    TeamSquadFragment.this.getHomeActivity().alertDialog.show();
                    return Boolean.TRUE.booleanValue();
                }
            });
        }
        Button buttonAutoLineup = (Button) this.rootView.findViewById(R.id.fragmentTeamSquadButtonAuto);
        buttonAutoLineup.setOnClickListener(new View.OnClickListener() { // from class: com.blank.bm15.activity.fragment.TeamSquadFragment.3
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                Lineup.setBetterLineup(team);
                TeamSquadFragment.this.createPage();
            }
        });
        Button buttonDraftRounds = (Button) this.rootView.findViewById(R.id.fragmentTeamSquadButtonDraftRounds);
        buttonDraftRounds.setOnClickListener(new View.OnClickListener() { // from class: com.blank.bm15.activity.fragment.TeamSquadFragment.4
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                DraftRound draftRoundFilter = new DraftRound(TeamSquadFragment.this.getHomeActivity());
                draftRoundFilter.setGame(TeamSquadFragment.this.getGame());
                draftRoundFilter.getTeamUser().setId(TeamSquadFragment.this.getGame().getUserTeam().getId());
                draftRoundFilter.setRound(1);
                List<DraftRound> draftRoundList = BlankDao.getSome(draftRoundFilter);
                Collections.sort(draftRoundList, new DraftRoundComparator(0, 1));
                String text = "";
                for (DraftRound draftRound : draftRoundList) {
                    text = String.valueOf(text) + String.format(TeamSquadFragment.this.getHomeActivity().getString(R.string.trade_round_1), draftRound.getTeamOwner().getName()) + "\n";
                }
                String text2 = String.valueOf(text) + String.format(TeamSquadFragment.this.getHomeActivity().getString(R.string.trade_round_2), TeamSquadFragment.this.getGame().getUserTeam().getName());
                AlertDialog.Builder builder = Alert.getBuilder(TeamSquadFragment.this.getHomeActivity());
                builder.setTitle(TeamSquadFragment.this.getString(R.string.trade_draft_rounds)).setMessage(text2).setCancelable(false).setIcon(R.drawable.ic_info).setNegativeButton(TeamSquadFragment.this.getString(R.string.button_close), new DialogInterface.OnClickListener() { // from class: com.blank.bm15.activity.fragment.TeamSquadFragment.4.1
                    @Override // android.content.DialogInterface.OnClickListener
                    public void onClick(DialogInterface dialog, int id) {
                        dialog.cancel();
                    }
                });
                AlertDialog alert = builder.create();
                alert.show();
                TeamSquadFragment.this.createPage();
            }
        });
        if (team.getId() != null && getGame().getUserTeam().getId() != null && team.getId().intValue() == getGame().getUserTeam().getId().intValue()) {
            buttonAutoLineup.setEnabled(Boolean.TRUE.booleanValue());
            buttonDraftRounds.setEnabled(Boolean.TRUE.booleanValue());
            buttonAutoLineup.setBackgroundColor(getHomeActivity().getResources().getColor(R.color.holo_red_dark));
            buttonDraftRounds.setBackgroundColor(getHomeActivity().getResources().getColor(R.color.holo_orange_dark));
            return;
        }
        buttonAutoLineup.setEnabled(Boolean.FALSE.booleanValue());
        buttonDraftRounds.setEnabled(Boolean.FALSE.booleanValue());
        buttonAutoLineup.setBackgroundColor(getHomeActivity().getResources().getColor(R.color.base_gray_very_dark));
        buttonDraftRounds.setBackgroundColor(getHomeActivity().getResources().getColor(R.color.base_gray_very_dark));
    }

    private SeparatedListAdapter getAdapter(Team team) {
        List<Player> titulars = team.getTactic().getPlayersTitulars();
        List<Player> reserves = team.getTactic().getPlayersReserves();
        List<Player> remains = team.getTactic().getPlayersRemains();
        Collections.sort(remains, new PlayerComparator(1, -1));
        SeparatedListAdapter separatedAdapter = new SeparatedListAdapter(getHomeActivity());
        if (!titulars.isEmpty()) {
            AdapterPlayerList adapter = new AdapterPlayerList(getHomeActivity(), R.layout.spinner_player, titulars, Boolean.FALSE.booleanValue());
            separatedAdapter.addSection(getHomeActivity().getString(R.string.team_titular), adapter);
        }
        if (!reserves.isEmpty()) {
            AdapterPlayerList adapter2 = new AdapterPlayerList(getHomeActivity(), R.layout.spinner_player, reserves, Boolean.FALSE.booleanValue());
            separatedAdapter.addSection(getHomeActivity().getString(R.string.team_reserve), adapter2);
        }
        if (!remains.isEmpty()) {
            AdapterPlayerList adapter3 = new AdapterPlayerList(getHomeActivity(), R.layout.spinner_player, remains, Boolean.FALSE.booleanValue());
            separatedAdapter.addSection(getHomeActivity().getString(R.string.team_remain), adapter3);
        }
        return separatedAdapter;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public SeparatedListAdapter getMatchPositions(Player player) {
        List<StringText> matchPositionTitularsList = new ArrayList<>();
        matchPositionTitularsList.add(new StringText(1, Util.getLongPositionString(getHomeActivity(), 1), player));
        matchPositionTitularsList.add(new StringText(2, Util.getLongPositionString(getHomeActivity(), 2), player));
        matchPositionTitularsList.add(new StringText(3, Util.getLongPositionString(getHomeActivity(), 3), player));
        matchPositionTitularsList.add(new StringText(4, Util.getLongPositionString(getHomeActivity(), 4), player));
        matchPositionTitularsList.add(new StringText(5, Util.getLongPositionString(getHomeActivity(), 5), player));
        List<StringText> matchPositionReservesList = new ArrayList<>();
        matchPositionReservesList.add(new StringText(6, Util.getLongPositionString(getHomeActivity(), 1), player));
        matchPositionReservesList.add(new StringText(7, Util.getLongPositionString(getHomeActivity(), 2), player));
        matchPositionReservesList.add(new StringText(8, Util.getLongPositionString(getHomeActivity(), 3), player));
        matchPositionReservesList.add(new StringText(9, Util.getLongPositionString(getHomeActivity(), 4), player));
        matchPositionReservesList.add(new StringText(10, Util.getLongPositionString(getHomeActivity(), 5), player));
        SeparatedListAdapter separatedAdapter = new SeparatedListAdapter(getHomeActivity());
        AdapterStringTextList adapter = new AdapterStringTextList(getHomeActivity(), R.layout.spinner_string, matchPositionTitularsList);
        separatedAdapter.addSection(getHomeActivity().getString(R.string.team_titular), adapter);
        AdapterStringTextList adapter2 = new AdapterStringTextList(getHomeActivity(), R.layout.spinner_string, matchPositionReservesList);
        separatedAdapter.addSection(getHomeActivity().getString(R.string.team_reserve), adapter2);
        return separatedAdapter;
    }
}
