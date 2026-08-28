package com.blank.bm15.activity.fragment;

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
import android.widget.TextView;
import com.blank.bm15.activity.adapter.AdapterDraftRoundList;
import com.blank.bm15.activity.adapter.AdapterPlayerTradeList;
import com.blank.bm15.activity.adapter.AdapterSelectTeamList;
import com.blank.bm15.activity.adapter.SeparatedListAdapter;
import com.blank.bm15.activity.base.BaseFragment;
import com.blank.bm15.dao.BlankDao;
import com.blank.bm15.dao.utils.BlankObj;
import com.blank.bm15.dao.utils.BlankSharedPreferences;
import com.blank.bm15.model.comparator.PlayerComparator;
import com.blank.bm15.model.comparator.TeamComparator;
import com.blank.bm15.model.object.crud.DraftRound;
import com.blank.bm15.model.object.crud.Player;
import com.blank.bm15.model.object.crud.Team;
import com.blank.bm15.model.object.crud.Trade;
import com.blank.bm15.model.util.Alert;
import com.blank.bm15.model.util.Util;
import com.blank.bm15pro.R;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class TradeFragment extends BaseFragment {
    String FILTER_SHARED_PREFERENCE = "FILTER_TRADE";
    private Integer numPlayersMinInTeam = 13;
    private Button teamButton;
    private List<Team> teamList;
    private Trade tempTrade;
    private List<Trade> tempTradeList;
    private Trade trade;

    public static final TradeFragment newInstance(int fragmentLayout, Integer navigationMode) {
        TradeFragment fragment = new TradeFragment();
        Bundle args = new Bundle(2);
        args.putInt(FRAGMENT_LAYOUT, fragmentLayout);
        args.putInt(NAVIGATION_MODE, navigationMode.intValue());
        fragment.setArguments(args);
        return fragment;
    }

    @Override // com.blank.bm15.activity.base.BaseFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        if (getGame().getCurrentMatchday().intValue() == 231) {
            this.numPlayersMinInTeam = 7;
        }
        createPage();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void createPage() {
        Team team = new Team(getHomeActivity());
        team.setId(Integer.valueOf(BlankSharedPreferences.getInt(getHomeActivity(), this.FILTER_SHARED_PREFERENCE, 0)));
        BlankDao.loadById(team);
        getGame().getUserTeam().getTactic().reloadPlayers();
        Team filter = new Team(getHomeActivity());
        filter.setGame(getGame());
        this.teamList = BlankDao.getSome(filter);
        Collections.sort(this.teamList, new TeamComparator(1, 1));
        this.teamButton = (Button) this.rootView.findViewById(R.id.fragmentTradeButtonSelectTeam);
        final Button elementButton1 = (Button) this.rootView.findViewById(R.id.fragmentTradeButtonElement1);
        final Button elementButton2 = (Button) this.rootView.findViewById(R.id.fragmentTradeButtonElement2);
        final Button elementButton3 = (Button) this.rootView.findViewById(R.id.fragmentTradeButtonElement3);
        final Button findButton = (Button) this.rootView.findViewById(R.id.fragmentTradeButtonFind);
        elementButton1.setText(getHomeActivity().getString(R.string.trade_element));
        elementButton2.setText(getHomeActivity().getString(R.string.trade_element));
        elementButton3.setText(getHomeActivity().getString(R.string.trade_element));
        elementButton1.setEnabled(team.getId() != null);
        elementButton2.setEnabled(team.getId() != null);
        elementButton3.setEnabled(team.getId() != null);
        findButton.setEnabled(Boolean.FALSE.booleanValue());
        findButton.setBackgroundColor(getHomeActivity().getResources().getColor(R.color.base_gray_dark));
        if (team.getId() == null) {
            elementButton1.setBackgroundColor(getHomeActivity().getResources().getColor(R.color.base_gray_light));
            elementButton2.setBackgroundColor(getHomeActivity().getResources().getColor(R.color.base_gray_light));
            elementButton3.setBackgroundColor(getHomeActivity().getResources().getColor(R.color.base_gray_light));
            this.teamButton.setText(getHomeActivity().getString(R.string.trade_select_team));
        } else {
            this.teamButton.setText(team.getName());
            elementButton1.setBackgroundColor(getHomeActivity().getResources().getColor(R.color.holo_green_light));
            elementButton2.setBackgroundColor(getHomeActivity().getResources().getColor(R.color.holo_green_light));
            elementButton3.setBackgroundColor(getHomeActivity().getResources().getColor(R.color.holo_green_light));
            this.trade = null;
            this.tempTradeList = null;
            if (team.getId().intValue() != getGame().getUserTeam().getId().intValue()) {
                getTrade().setTeamB(team);
            } else {
                getTrade().setTeamB(null);
            }
            if (getHomeActivity().alertDialog != null) {
                getHomeActivity().alertDialog.cancel();
            }
        }
        this.teamButton.setOnClickListener(new View.OnClickListener() { // from class: com.blank.bm15.activity.fragment.TradeFragment.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                AlertDialog.Builder builder = new AlertDialog.Builder(TradeFragment.this.getHomeActivity());
                LayoutInflater inflater = TradeFragment.this.getHomeActivity().getLayoutInflater();
                View dialogView = inflater.inflate(R.layout.dialog_team_players, (ViewGroup) null);
                TextView textView = (TextView) dialogView.findViewById(R.id.dialogTeamPlayersTextViewTitle);
                textView.setText(TradeFragment.this.getHomeActivity().getString(R.string.trade_select_team));
                builder.setView(dialogView).setPositiveButton(TradeFragment.this.getString(R.string.button_remove), new DialogInterface.OnClickListener() { // from class: com.blank.bm15.activity.fragment.TradeFragment.1.1
                    @Override // android.content.DialogInterface.OnClickListener
                    public void onClick(DialogInterface dialog, int id) {
                        BlankSharedPreferences.setInt(TradeFragment.this.getHomeActivity(), TradeFragment.this.FILTER_SHARED_PREFERENCE, 0);
                        TradeFragment.this.trade = null;
                        TradeFragment.this.tempTrade = null;
                        TradeFragment.this.tempTradeList = null;
                        TradeFragment.this.teamButton = null;
                        TradeFragment.this.teamList = null;
                        dialog.cancel();
                        TradeFragment.this.createPage();
                    }
                }).setNegativeButton(TradeFragment.this.getString(R.string.button_cancel), new DialogInterface.OnClickListener() { // from class: com.blank.bm15.activity.fragment.TradeFragment.1.2
                    @Override // android.content.DialogInterface.OnClickListener
                    public void onClick(DialogInterface dialog, int id) {
                        dialog.cancel();
                    }
                });
                final ListView listView = (ListView) dialogView.findViewById(R.id.dialogTeamPlayersListViewList);
                listView.setAdapter((ListAdapter) new AdapterSelectTeamList(TradeFragment.this.getHomeActivity(), R.layout.spinner_team, TradeFragment.this.teamList));
                listView.setOnItemClickListener(new AdapterView.OnItemClickListener() { // from class: com.blank.bm15.activity.fragment.TradeFragment.1.3
                    @Override // android.widget.AdapterView.OnItemClickListener
                    public void onItemClick(AdapterView<?> arg0, View arg1, int position, long arg3) {
                        Team team2 = (Team) listView.getItemAtPosition(position);
                        BlankSharedPreferences.setInt(TradeFragment.this.getHomeActivity(), TradeFragment.this.FILTER_SHARED_PREFERENCE, team2.getId().intValue());
                        TradeFragment.this.createPage();
                    }
                });
                TradeFragment.this.getHomeActivity().alertDialog = builder.create();
                TradeFragment.this.getHomeActivity().alertDialog.show();
            }
        });
        elementButton1.setContentDescription(null);
        elementButton1.setOnClickListener(new View.OnClickListener() { // from class: com.blank.bm15.activity.fragment.TradeFragment.2
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                AlertDialog.Builder builder = new AlertDialog.Builder(TradeFragment.this.getHomeActivity());
                LayoutInflater inflater = TradeFragment.this.getHomeActivity().getLayoutInflater();
                View dialogView = inflater.inflate(R.layout.dialog_team_players, (ViewGroup) null);
                TextView textView = (TextView) dialogView.findViewById(R.id.dialogTeamPlayersTextViewTitle);
                textView.setText(TradeFragment.this.getHomeActivity().getString(R.string.trade_element));
                AlertDialog.Builder view = builder.setView(dialogView);
                String string = TradeFragment.this.getString(R.string.button_remove);
                final Button button = elementButton1;
                final Button button2 = findButton;
                view.setNeutralButton(string, new DialogInterface.OnClickListener() { // from class: com.blank.bm15.activity.fragment.TradeFragment.2.1
                    @Override // android.content.DialogInterface.OnClickListener
                    public void onClick(DialogInterface dialog, int id) {
                        TradeFragment.this.tempTrade = null;
                        TradeFragment.this.tempTradeList = null;
                        TradeFragment.this.getTrade().setPlayerA1(null);
                        TradeFragment.this.getTrade().setPlayerB1(null);
                        TradeFragment.this.getTrade().setDraftRoundA1(null);
                        TradeFragment.this.getTrade().setDraftRoundB1(null);
                        button.setText(TradeFragment.this.getHomeActivity().getString(R.string.trade_element));
                        if (TradeFragment.this.getTrade().getPlayerA2().getId() == null && TradeFragment.this.getTrade().getPlayerB2().getId() == null && TradeFragment.this.getTrade().getPlayerA3().getId() == null && TradeFragment.this.getTrade().getPlayerB3().getId() == null && TradeFragment.this.getTrade().getDraftRoundA2().getId() == null && TradeFragment.this.getTrade().getDraftRoundB2().getId() == null && TradeFragment.this.getTrade().getDraftRoundA3().getId() == null && TradeFragment.this.getTrade().getDraftRoundB3().getId() == null) {
                            button2.setEnabled(Boolean.FALSE.booleanValue());
                            button2.setBackgroundColor(TradeFragment.this.getHomeActivity().getResources().getColor(R.color.base_gray_dark));
                        }
                        dialog.cancel();
                    }
                }).setNegativeButton(TradeFragment.this.getString(R.string.button_cancel), new DialogInterface.OnClickListener() { // from class: com.blank.bm15.activity.fragment.TradeFragment.2.2
                    @Override // android.content.DialogInterface.OnClickListener
                    public void onClick(DialogInterface dialog, int id) {
                        dialog.cancel();
                    }
                });
                final ListView listView = (ListView) dialogView.findViewById(R.id.dialogTeamPlayersListViewList);
                listView.setAdapter((ListAdapter) TradeFragment.this.getAdapter());
                final Button button3 = elementButton1;
                final Button button4 = findButton;
                listView.setOnItemClickListener(new AdapterView.OnItemClickListener() { // from class: com.blank.bm15.activity.fragment.TradeFragment.2.3
                    @Override // android.widget.AdapterView.OnItemClickListener
                    public void onItemClick(AdapterView<?> arg0, View arg1, int position, long arg3) {
                        String text;
                        TradeFragment.this.tempTradeList = null;
                        int teamId = BlankObj.toInteger(Integer.valueOf(BlankSharedPreferences.getInt(TradeFragment.this.getHomeActivity(), TradeFragment.this.FILTER_SHARED_PREFERENCE, 0))).intValue();
                        Object obj = listView.getItemAtPosition(position);
                        TradeFragment.this.getTrade().setPlayerA1(null);
                        TradeFragment.this.getTrade().setPlayerB1(null);
                        TradeFragment.this.getTrade().setDraftRoundA1(null);
                        TradeFragment.this.getTrade().setDraftRoundB1(null);
                        if (obj instanceof Player) {
                            if (teamId == TradeFragment.this.getGame().getUserTeam().getId().intValue()) {
                                TradeFragment.this.getTrade().setPlayerA1((Player) obj);
                            } else {
                                TradeFragment.this.getTrade().setPlayerB1((Player) obj);
                            }
                            String text2 = " (" + Util.getLongPositionString(TradeFragment.this.getHomeActivity(), ((Player) obj).getPositionFirst());
                            if (((Player) obj).getPositionSecond().intValue() != 0) {
                                text = String.valueOf(text2) + " - " + Util.getLongPositionString(TradeFragment.this.getHomeActivity(), ((Player) obj).getPositionSecond()) + ")";
                            } else {
                                text = String.valueOf(text2) + ")";
                            }
                            button3.setText(String.valueOf(((Player) obj).getShortName()) + " - " + BlankObj.toInteger(((Player) obj).getAverageSkillAll()) + " " + (String.valueOf(text) + " " + ((Player) obj).getAge() + " " + TradeFragment.this.getHomeActivity().getString(R.string.free_agent_years_contract) + "."));
                        } else {
                            if (teamId == TradeFragment.this.getGame().getUserTeam().getId().intValue()) {
                                TradeFragment.this.getTrade().setDraftRoundA1((DraftRound) obj);
                            } else {
                                TradeFragment.this.getTrade().setDraftRoundB1((DraftRound) obj);
                            }
                            button3.setText(String.format(TradeFragment.this.getHomeActivity().getString(R.string.trade_round_1), ((DraftRound) obj).getTeamOwner().getName()));
                        }
                        button4.setEnabled(Boolean.TRUE.booleanValue());
                        button4.setBackgroundColor(TradeFragment.this.getHomeActivity().getResources().getColor(R.color.holo_red_dark));
                        TradeFragment.this.getHomeActivity().alertDialog.cancel();
                    }
                });
                TradeFragment.this.getHomeActivity().alertDialog = builder.create();
                TradeFragment.this.getHomeActivity().alertDialog.show();
            }
        });
        elementButton2.setContentDescription(null);
        elementButton2.setOnClickListener(new View.OnClickListener() { // from class: com.blank.bm15.activity.fragment.TradeFragment.3
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                AlertDialog.Builder builder = new AlertDialog.Builder(TradeFragment.this.getHomeActivity());
                LayoutInflater inflater = TradeFragment.this.getHomeActivity().getLayoutInflater();
                View dialogView = inflater.inflate(R.layout.dialog_team_players, (ViewGroup) null);
                TextView textView = (TextView) dialogView.findViewById(R.id.dialogTeamPlayersTextViewTitle);
                textView.setText(TradeFragment.this.getHomeActivity().getString(R.string.trade_element));
                AlertDialog.Builder view = builder.setView(dialogView);
                String string = TradeFragment.this.getString(R.string.button_remove);
                final Button button = elementButton2;
                final Button button2 = findButton;
                view.setNeutralButton(string, new DialogInterface.OnClickListener() { // from class: com.blank.bm15.activity.fragment.TradeFragment.3.1
                    @Override // android.content.DialogInterface.OnClickListener
                    public void onClick(DialogInterface dialog, int id) {
                        TradeFragment.this.tempTrade = null;
                        TradeFragment.this.tempTradeList = null;
                        TradeFragment.this.getTrade().setPlayerA2(null);
                        TradeFragment.this.getTrade().setPlayerB2(null);
                        TradeFragment.this.getTrade().setDraftRoundA2(null);
                        TradeFragment.this.getTrade().setDraftRoundB2(null);
                        button.setText(TradeFragment.this.getHomeActivity().getString(R.string.trade_element));
                        if (TradeFragment.this.getTrade().getPlayerA1().getId() == null && TradeFragment.this.getTrade().getPlayerB1().getId() == null && TradeFragment.this.getTrade().getPlayerA3().getId() == null && TradeFragment.this.getTrade().getPlayerB3().getId() == null && TradeFragment.this.getTrade().getDraftRoundA1().getId() == null && TradeFragment.this.getTrade().getDraftRoundB1().getId() == null && TradeFragment.this.getTrade().getDraftRoundA3().getId() == null && TradeFragment.this.getTrade().getDraftRoundB3().getId() == null) {
                            button2.setEnabled(Boolean.FALSE.booleanValue());
                            button2.setBackgroundColor(TradeFragment.this.getHomeActivity().getResources().getColor(R.color.base_gray_dark));
                        }
                        dialog.cancel();
                    }
                }).setNegativeButton(TradeFragment.this.getString(R.string.button_cancel), new DialogInterface.OnClickListener() { // from class: com.blank.bm15.activity.fragment.TradeFragment.3.2
                    @Override // android.content.DialogInterface.OnClickListener
                    public void onClick(DialogInterface dialog, int id) {
                        dialog.cancel();
                    }
                });
                final ListView listView = (ListView) dialogView.findViewById(R.id.dialogTeamPlayersListViewList);
                listView.setAdapter((ListAdapter) TradeFragment.this.getAdapter());
                final Button button3 = elementButton2;
                final Button button4 = findButton;
                listView.setOnItemClickListener(new AdapterView.OnItemClickListener() { // from class: com.blank.bm15.activity.fragment.TradeFragment.3.3
                    @Override // android.widget.AdapterView.OnItemClickListener
                    public void onItemClick(AdapterView<?> arg0, View arg1, int position, long arg3) {
                        String text;
                        TradeFragment.this.tempTradeList = null;
                        int teamId = BlankObj.toInteger(Integer.valueOf(BlankSharedPreferences.getInt(TradeFragment.this.getHomeActivity(), TradeFragment.this.FILTER_SHARED_PREFERENCE, 0))).intValue();
                        Object obj = listView.getItemAtPosition(position);
                        TradeFragment.this.getTrade().setPlayerA2(null);
                        TradeFragment.this.getTrade().setPlayerB2(null);
                        TradeFragment.this.getTrade().setDraftRoundA2(null);
                        TradeFragment.this.getTrade().setDraftRoundB2(null);
                        if (obj instanceof Player) {
                            if (teamId == TradeFragment.this.getGame().getUserTeam().getId().intValue()) {
                                TradeFragment.this.getTrade().setPlayerA2((Player) obj);
                            } else {
                                TradeFragment.this.getTrade().setPlayerB2((Player) obj);
                            }
                            String text2 = " (" + Util.getLongPositionString(TradeFragment.this.getHomeActivity(), ((Player) obj).getPositionFirst());
                            if (((Player) obj).getPositionSecond().intValue() != 0) {
                                text = String.valueOf(text2) + " - " + Util.getLongPositionString(TradeFragment.this.getHomeActivity(), ((Player) obj).getPositionSecond()) + ")";
                            } else {
                                text = String.valueOf(text2) + ")";
                            }
                            button3.setText(String.valueOf(((Player) obj).getShortName()) + " - " + BlankObj.toInteger(((Player) obj).getAverageSkillAll()) + " " + (String.valueOf(text) + " " + ((Player) obj).getAge() + " " + TradeFragment.this.getHomeActivity().getString(R.string.free_agent_years_contract) + "."));
                        } else {
                            if (teamId == TradeFragment.this.getGame().getUserTeam().getId().intValue()) {
                                TradeFragment.this.getTrade().setDraftRoundA2((DraftRound) obj);
                            } else {
                                TradeFragment.this.getTrade().setDraftRoundB2((DraftRound) obj);
                            }
                            button3.setText(String.format(TradeFragment.this.getHomeActivity().getString(R.string.trade_round_1), ((DraftRound) obj).getTeamOwner().getName()));
                        }
                        button4.setEnabled(Boolean.TRUE.booleanValue());
                        button4.setBackgroundColor(TradeFragment.this.getHomeActivity().getResources().getColor(R.color.holo_red_dark));
                        TradeFragment.this.getHomeActivity().alertDialog.cancel();
                    }
                });
                TradeFragment.this.getHomeActivity().alertDialog = builder.create();
                TradeFragment.this.getHomeActivity().alertDialog.show();
            }
        });
        elementButton3.setContentDescription(null);
        elementButton3.setOnClickListener(new View.OnClickListener() { // from class: com.blank.bm15.activity.fragment.TradeFragment.4
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                AlertDialog.Builder builder = new AlertDialog.Builder(TradeFragment.this.getHomeActivity());
                LayoutInflater inflater = TradeFragment.this.getHomeActivity().getLayoutInflater();
                View dialogView = inflater.inflate(R.layout.dialog_team_players, (ViewGroup) null);
                TextView textView = (TextView) dialogView.findViewById(R.id.dialogTeamPlayersTextViewTitle);
                textView.setText(TradeFragment.this.getHomeActivity().getString(R.string.trade_element));
                AlertDialog.Builder view = builder.setView(dialogView);
                String string = TradeFragment.this.getString(R.string.button_remove);
                final Button button = elementButton3;
                final Button button2 = findButton;
                view.setNeutralButton(string, new DialogInterface.OnClickListener() { // from class: com.blank.bm15.activity.fragment.TradeFragment.4.1
                    @Override // android.content.DialogInterface.OnClickListener
                    public void onClick(DialogInterface dialog, int id) {
                        TradeFragment.this.tempTrade = null;
                        TradeFragment.this.tempTradeList = null;
                        TradeFragment.this.getTrade().setPlayerA3(null);
                        TradeFragment.this.getTrade().setPlayerB3(null);
                        TradeFragment.this.getTrade().setDraftRoundA3(null);
                        TradeFragment.this.getTrade().setDraftRoundB3(null);
                        button.setText(TradeFragment.this.getHomeActivity().getString(R.string.trade_element));
                        if (TradeFragment.this.getTrade().getPlayerA1().getId() == null && TradeFragment.this.getTrade().getPlayerB1().getId() == null && TradeFragment.this.getTrade().getPlayerA2().getId() == null && TradeFragment.this.getTrade().getPlayerB2().getId() == null && TradeFragment.this.getTrade().getDraftRoundA1().getId() == null && TradeFragment.this.getTrade().getDraftRoundB1().getId() == null && TradeFragment.this.getTrade().getDraftRoundA2().getId() == null && TradeFragment.this.getTrade().getDraftRoundB2().getId() == null) {
                            button2.setEnabled(Boolean.FALSE.booleanValue());
                            button2.setBackgroundColor(TradeFragment.this.getHomeActivity().getResources().getColor(R.color.base_gray_dark));
                        }
                        dialog.cancel();
                    }
                }).setNegativeButton(TradeFragment.this.getString(R.string.button_cancel), new DialogInterface.OnClickListener() { // from class: com.blank.bm15.activity.fragment.TradeFragment.4.2
                    @Override // android.content.DialogInterface.OnClickListener
                    public void onClick(DialogInterface dialog, int id) {
                        dialog.cancel();
                    }
                });
                final ListView listView = (ListView) dialogView.findViewById(R.id.dialogTeamPlayersListViewList);
                listView.setAdapter((ListAdapter) TradeFragment.this.getAdapter());
                final Button button3 = elementButton3;
                final Button button4 = findButton;
                listView.setOnItemClickListener(new AdapterView.OnItemClickListener() { // from class: com.blank.bm15.activity.fragment.TradeFragment.4.3
                    @Override // android.widget.AdapterView.OnItemClickListener
                    public void onItemClick(AdapterView<?> arg0, View arg1, int position, long arg3) {
                        String text;
                        TradeFragment.this.tempTradeList = null;
                        int teamId = BlankObj.toInteger(Integer.valueOf(BlankSharedPreferences.getInt(TradeFragment.this.getHomeActivity(), TradeFragment.this.FILTER_SHARED_PREFERENCE, 0))).intValue();
                        Object obj = listView.getItemAtPosition(position);
                        TradeFragment.this.getTrade().setPlayerA3(null);
                        TradeFragment.this.getTrade().setPlayerB3(null);
                        TradeFragment.this.getTrade().setDraftRoundA3(null);
                        TradeFragment.this.getTrade().setDraftRoundB3(null);
                        if (obj instanceof Player) {
                            if (teamId == TradeFragment.this.getGame().getUserTeam().getId().intValue()) {
                                TradeFragment.this.getTrade().setPlayerA3((Player) obj);
                            } else {
                                TradeFragment.this.getTrade().setPlayerB3((Player) obj);
                            }
                            String text2 = " (" + Util.getLongPositionString(TradeFragment.this.getHomeActivity(), ((Player) obj).getPositionFirst());
                            if (((Player) obj).getPositionSecond().intValue() != 0) {
                                text = String.valueOf(text2) + " - " + Util.getLongPositionString(TradeFragment.this.getHomeActivity(), ((Player) obj).getPositionSecond()) + ")";
                            } else {
                                text = String.valueOf(text2) + ")";
                            }
                            button3.setText(String.valueOf(((Player) obj).getShortName()) + " - " + BlankObj.toInteger(((Player) obj).getAverageSkillAll()) + " " + (String.valueOf(text) + " " + ((Player) obj).getAge() + " " + TradeFragment.this.getHomeActivity().getString(R.string.free_agent_years_contract) + "."));
                        } else {
                            if (teamId == TradeFragment.this.getGame().getUserTeam().getId().intValue()) {
                                TradeFragment.this.getTrade().setDraftRoundA3((DraftRound) obj);
                            } else {
                                TradeFragment.this.getTrade().setDraftRoundB3((DraftRound) obj);
                            }
                            button3.setText(String.format(TradeFragment.this.getHomeActivity().getString(R.string.trade_round_1), ((DraftRound) obj).getTeamOwner().getName()));
                        }
                        button4.setEnabled(Boolean.TRUE.booleanValue());
                        button4.setBackgroundColor(TradeFragment.this.getHomeActivity().getResources().getColor(R.color.holo_red_dark));
                        TradeFragment.this.getHomeActivity().alertDialog.cancel();
                    }
                });
                TradeFragment.this.getHomeActivity().alertDialog = builder.create();
                TradeFragment.this.getHomeActivity().alertDialog.show();
            }
        });
        findButton.setContentDescription(null);
        findButton.setOnClickListener(new View.OnClickListener() { // from class: com.blank.bm15.activity.fragment.TradeFragment.5
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                if (TradeFragment.this.getTempTradeList().isEmpty()) {
                    int teamId = BlankObj.toInteger(Integer.valueOf(BlankSharedPreferences.getInt(TradeFragment.this.getHomeActivity(), TradeFragment.this.FILTER_SHARED_PREFERENCE, 0))).intValue();
                    if (TradeFragment.this.getGame().getUserTeam().getId().intValue() == teamId) {
                        Alert.showErrorDialog(TradeFragment.this.getHomeActivity(), Integer.valueOf(R.string.error_trade_user_team));
                        TradeFragment.this.tempTrade = null;
                        TradeFragment.this.tempTradeList = null;
                        return;
                    }
                    Alert.showErrorDialog(TradeFragment.this.getHomeActivity(), Integer.valueOf(R.string.error_trade_other_team));
                    return;
                }
                TradeFragment.this.openTradeDialog();
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void openTradeDialog() {
        final int teamId = BlankObj.toInteger(Integer.valueOf(BlankSharedPreferences.getInt(getHomeActivity(), this.FILTER_SHARED_PREFERENCE, 0))).intValue();
        this.tempTrade = null;
        getTempTrade();
        AlertDialog.Builder builder = new AlertDialog.Builder(getHomeActivity());
        LayoutInflater inflater = getHomeActivity().getLayoutInflater();
        View dialogView = inflater.inflate(R.layout.dialog_team_players, (ViewGroup) null);
        TextView textView = (TextView) dialogView.findViewById(R.id.dialogTeamPlayersTextViewTitle);
        if (getGame().getUserTeam().getId().intValue() == teamId) {
            textView.setText(String.format(getHomeActivity().getString(R.string.trade_elements), getTrade().getTeamB().getName()));
        } else {
            textView.setText(String.format(getHomeActivity().getString(R.string.trade_elements), getTrade().getTeamA().getName()));
        }
        builder.setView(dialogView);
        ListView listView = (ListView) dialogView.findViewById(R.id.dialogTeamPlayersListViewList);
        listView.setAdapter((ListAdapter) getTradeAdapter());
        builder.setPositiveButton(getString(R.string.button_accept), new DialogInterface.OnClickListener() { // from class: com.blank.bm15.activity.fragment.TradeFragment.6
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int id) {
                if (TradeFragment.this.getGame().getUserTeam().getId().intValue() == teamId) {
                    TradeFragment.this.getTrade().setDraftRoundB1(TradeFragment.this.getTempTrade().getDraftRoundA1());
                    TradeFragment.this.getTrade().setDraftRoundB2(TradeFragment.this.getTempTrade().getDraftRoundA2());
                    TradeFragment.this.getTrade().setDraftRoundB3(TradeFragment.this.getTempTrade().getDraftRoundA3());
                    TradeFragment.this.getTrade().setPlayerB1(TradeFragment.this.getTempTrade().getPlayerA1());
                    TradeFragment.this.getTrade().setPlayerB2(TradeFragment.this.getTempTrade().getPlayerA2());
                    TradeFragment.this.getTrade().setPlayerB3(TradeFragment.this.getTempTrade().getPlayerA3());
                } else {
                    TradeFragment.this.getTrade().setDraftRoundA1(TradeFragment.this.getTempTrade().getDraftRoundA1());
                    TradeFragment.this.getTrade().setDraftRoundA2(TradeFragment.this.getTempTrade().getDraftRoundA2());
                    TradeFragment.this.getTrade().setDraftRoundA3(TradeFragment.this.getTempTrade().getDraftRoundA3());
                    TradeFragment.this.getTrade().setPlayerA1(TradeFragment.this.getTempTrade().getPlayerA1());
                    TradeFragment.this.getTrade().setPlayerA2(TradeFragment.this.getTempTrade().getPlayerA2());
                    TradeFragment.this.getTrade().setPlayerA3(TradeFragment.this.getTempTrade().getPlayerA3());
                }
                TradeFragment.this.saveTrade(TradeFragment.this.getTrade());
                TradeFragment.this.getHomeActivity().alertDialog.cancel();
                TradeFragment.this.createPage();
                Alert.showNoticeDialog(TradeFragment.this.getHomeActivity(), Integer.valueOf(R.string.notice_trade_between_teams));
            }
        }).setNeutralButton(getString(R.string.button_try_other), new DialogInterface.OnClickListener() { // from class: com.blank.bm15.activity.fragment.TradeFragment.7
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int id) {
                dialog.cancel();
                if (TradeFragment.this.getGame().getUserTeam().getId().intValue() == teamId) {
                    TradeFragment.this.tempTradeList = null;
                    if (TradeFragment.this.getTempTradeList().isEmpty()) {
                        Alert.showErrorDialog(TradeFragment.this.getHomeActivity(), Integer.valueOf(R.string.error_trade_user_team));
                        TradeFragment.this.tempTrade = null;
                        TradeFragment.this.tempTradeList = null;
                        dialog.cancel();
                        return;
                    }
                    TradeFragment.this.openTradeDialog();
                    return;
                }
                TradeFragment.this.openTradeDialog();
            }
        }).setNegativeButton(getString(R.string.button_cancel), new DialogInterface.OnClickListener() { // from class: com.blank.bm15.activity.fragment.TradeFragment.8
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int id) {
                dialog.cancel();
            }
        });
        getHomeActivity().alertDialog = builder.create();
        getHomeActivity().alertDialog.show();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Trade getTrade() {
        if (this.trade == null) {
            this.trade = new Trade(getGame().getContext());
            this.trade.setTeamA(getGame().getUserTeam());
        }
        return this.trade;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Trade getTempTrade() {
        if (this.tempTrade == null) {
            List<Trade> list = getTempTradeList();
            if (!list.isEmpty()) {
                this.tempTrade = list.get(Util.getRandomValue(0, Integer.valueOf(list.size() - 1)).intValue());
            } else {
                this.tempTrade = new Trade(getHomeActivity());
            }
        }
        return this.tempTrade;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0127 A[PHI: r6 r14
      0x0127: PHI (r6v3 'tradeElementsValues1' double) = (r6v2 'tradeElementsValues1' double), (r6v4 'tradeElementsValues1' double) binds: [B:28:0x011d, B:24:0x00f5] A[DONT_GENERATE, DONT_INLINE]
      0x0127: PHI (r14v2 'tradeElementsSalary1' double) = (r14v1 'tradeElementsSalary1' double), (r14v3 'tradeElementsSalary1' double) binds: [B:28:0x011d, B:24:0x00f5] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:42:0x01cc A[PHI: r20 r28
      0x01cc: PHI (r20v3 'tradeElementsValues2' double) = (r20v2 'tradeElementsValues2' double), (r20v4 'tradeElementsValues2' double) binds: [B:40:0x01b9, B:36:0x0181] A[DONT_GENERATE, DONT_INLINE]
      0x01cc: PHI (r28v2 'tradeElementsSalary2' double) = (r28v1 'tradeElementsSalary2' double), (r28v3 'tradeElementsSalary2' double) binds: [B:40:0x01b9, B:36:0x0181] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.util.List<com.blank.bm15.model.object.crud.Trade> getTempTradeList() {
        /*
            Method dump skipped, instruction units count: 621
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.blank.bm15.activity.fragment.TradeFragment.getTempTradeList():java.util.List");
    }

    private boolean getAddElementToTrade(double elementsValues, double tradeElementsValues, double numOfElements, double numOfTradeElements, double elementsSalary, double tradeElementsSalary) {
        int numOfPlayersTeamA = getTrade().getTeamA().getTactic().getPlayers().size();
        int numOfPlayersTeamB = getTrade().getTeamB().getTactic().getPlayers().size();
        int salaryTeamA = getTrade().getTeamA().getTeamSalary(null).intValue();
        int salaryTeamB = getTrade().getTeamB().getTeamSalary(null).intValue();
        int salaryCapTeamA = getTrade().getTeamA().getSalaryCap().intValue();
        int salaryCapTeamB = getTrade().getTeamB().getSalaryCap().intValue();
        int teamId = BlankObj.toInteger(Integer.valueOf(BlankSharedPreferences.getInt(getHomeActivity(), this.FILTER_SHARED_PREFERENCE, 0))).intValue();
        double value1 = (3.0d * elementsValues) / 100.0d;
        double value2 = (12.0d * elementsValues) / 100.0d;
        if (value2 - value1 < 7.0d) {
            value2 = value1 + 7.0d;
        }
        if (getGame().getUserTeam().getId().intValue() != teamId || elementsValues <= tradeElementsValues + value1 || elementsValues >= tradeElementsValues + value2) {
            if (getGame().getUserTeam().getId().intValue() != teamId && elementsValues + value1 < tradeElementsValues && elementsValues + value2 > tradeElementsValues && (((double) numOfPlayersTeamA) - numOfTradeElements) + numOfElements >= this.numPlayersMinInTeam.intValue() && (((double) numOfPlayersTeamA) - numOfTradeElements) + numOfElements < 21.0d && (((double) numOfPlayersTeamB) - numOfElements) + numOfTradeElements >= this.numPlayersMinInTeam.intValue() && (((double) numOfPlayersTeamB) - numOfElements) + numOfTradeElements < 21.0d) {
                if ((tradeElementsSalary > elementsSalary || (((double) salaryTeamA) - tradeElementsSalary) + elementsSalary < salaryCapTeamA) && (tradeElementsSalary < elementsSalary || (((double) salaryTeamB) + tradeElementsSalary) - elementsSalary < salaryCapTeamB)) {
                    return Boolean.TRUE.booleanValue();
                }
                return Boolean.FALSE.booleanValue();
            }
        } else if ((((double) numOfPlayersTeamA) - numOfElements) + numOfTradeElements >= this.numPlayersMinInTeam.intValue() && (((double) numOfPlayersTeamA) - numOfElements) + numOfTradeElements < 21.0d && (((double) numOfPlayersTeamB) - numOfTradeElements) + numOfElements >= this.numPlayersMinInTeam.intValue() && (((double) numOfPlayersTeamB) - numOfTradeElements) + numOfElements < 21.0d) {
            if ((tradeElementsSalary < elementsSalary || (((double) salaryTeamA) + tradeElementsSalary) - elementsSalary < salaryCapTeamA) && (tradeElementsSalary > elementsSalary || (((double) salaryTeamB) - tradeElementsSalary) + elementsSalary < salaryCapTeamB)) {
                return Boolean.TRUE.booleanValue();
            }
            return Boolean.FALSE.booleanValue();
        }
        return Boolean.FALSE.booleanValue();
    }

    private void getRandomTeam() {
        int teamId = BlankObj.toInteger(Integer.valueOf(BlankSharedPreferences.getInt(getHomeActivity(), this.FILTER_SHARED_PREFERENCE, 0))).intValue();
        if (getGame().getUserTeam().getId().intValue() == teamId) {
            boolean ok = Boolean.FALSE.booleanValue();
            while (!ok) {
                Team randomTeam = this.teamList.get(Util.getRandomValue(0, Integer.valueOf(this.teamList.size() - 1)).intValue());
                if (randomTeam.getId().intValue() != teamId) {
                    getTrade().setTeamB(randomTeam);
                    ok = Boolean.TRUE.booleanValue();
                }
            }
        }
    }

    private double getElementsValue() {
        return getElements(1);
    }

    private double getElementsNumOfPlayer() {
        return getElements(2);
    }

    private double getElementsSalary() {
        return getElements(3);
    }

    private double getElements(int type) {
        double dIntValue;
        double dIntValue2;
        double dIntValue3;
        double dIntValue4;
        double dIntValue5;
        double dIntValue6;
        double result = 0.0d;
        boolean value = type == 1;
        boolean number = type == 2;
        int teamId = BlankObj.toInteger(Integer.valueOf(BlankSharedPreferences.getInt(getHomeActivity(), this.FILTER_SHARED_PREFERENCE, 0))).intValue();
        if (getGame().getUserTeam().getId().intValue() == teamId) {
            if (getTrade().getPlayerA1().getId() != null) {
                if (value) {
                    dIntValue6 = getTrade().getPlayerA1().getMarketValue();
                } else {
                    dIntValue6 = number ? 1 : getTrade().getPlayerA1().getSalary().intValue();
                }
                result = 0.0d + dIntValue6;
            }
            if (getTrade().getPlayerA2().getId() != null) {
                if (value) {
                    dIntValue5 = getTrade().getPlayerA2().getMarketValue();
                } else {
                    dIntValue5 = number ? 1 : getTrade().getPlayerA2().getSalary().intValue();
                }
                result += dIntValue5;
            }
            if (getTrade().getPlayerA3().getId() != null) {
                if (value) {
                    dIntValue4 = getTrade().getPlayerA3().getMarketValue();
                } else {
                    dIntValue4 = number ? 1 : getTrade().getPlayerA3().getSalary().intValue();
                }
                result += dIntValue4;
            }
            if (getTrade().getDraftRoundA1().getId() != null) {
                result += value ? getTrade().getDraftRoundA1().getMarketValue().doubleValue() : 0.0d;
            }
            if (getTrade().getDraftRoundA2().getId() != null) {
                result += value ? getTrade().getDraftRoundA2().getMarketValue().doubleValue() : 0.0d;
            }
            if (getTrade().getDraftRoundA3().getId() != null) {
                return result + (value ? getTrade().getDraftRoundA3().getMarketValue().doubleValue() : 0.0d);
            }
            return result;
        }
        if (getTrade().getPlayerB1().getId() != null) {
            if (value) {
                dIntValue3 = getTrade().getPlayerB1().getMarketValue();
            } else {
                dIntValue3 = number ? 1 : getTrade().getPlayerB1().getSalary().intValue();
            }
            result = 0.0d + dIntValue3;
        }
        if (getTrade().getPlayerB2().getId() != null) {
            if (value) {
                dIntValue2 = getTrade().getPlayerB2().getMarketValue();
            } else {
                dIntValue2 = number ? 1 : getTrade().getPlayerB2().getSalary().intValue();
            }
            result += dIntValue2;
        }
        if (getTrade().getPlayerB3().getId() != null) {
            if (value) {
                dIntValue = getTrade().getPlayerB3().getMarketValue();
            } else {
                dIntValue = number ? 1 : getTrade().getPlayerB3().getSalary().intValue();
            }
            result += dIntValue;
        }
        if (getTrade().getDraftRoundB1().getId() != null) {
            result += value ? getTrade().getDraftRoundB1().getMarketValue().doubleValue() : 0.0d;
        }
        if (getTrade().getDraftRoundB2().getId() != null) {
            result += value ? getTrade().getDraftRoundB2().getMarketValue().doubleValue() : 0.0d;
        }
        if (getTrade().getDraftRoundB3().getId() != null) {
            return result + (value ? getTrade().getDraftRoundB3().getMarketValue().doubleValue() : 0.0d);
        }
        return result;
    }

    private List<Object> getPlayersAndDraftRounds(Team team) {
        Boolean isUserTeam = Boolean.TRUE;
        if (team == null) {
            isUserTeam = Boolean.FALSE;
            getRandomTeam();
            team = getTrade().getTeamB();
        }
        List<Object> playersAndDraftRounds = new ArrayList<>();
        for (Player player : team.getTactic().getPlayers()) {
            if (isUserTeam.booleanValue()) {
                playersAndDraftRounds.add(player);
            } else {
                int numPlayersOfPositionFirst = team.getNumPlayersOfPosition(player.getPositionFirst().intValue()) - 1;
                int numPlayersOfPositionSecond = team.getNumPlayersOfPosition(player.getPositionSecond().intValue());
                if (player.getPositionSecond().intValue() != 0) {
                    numPlayersOfPositionSecond--;
                }
                int tradeNumOfPlayersOfPositionFirst = getTrade().getNumPlayersOfPosition(player.getPositionFirst().intValue());
                int tradeNumOfPlayersOfPositionSecond = getTrade().getNumPlayersOfPosition(player.getPositionSecond().intValue());
                if (numPlayersOfPositionFirst + tradeNumOfPlayersOfPositionFirst > 2 && numPlayersOfPositionSecond + tradeNumOfPlayersOfPositionSecond > 2) {
                    playersAndDraftRounds.add(player);
                }
            }
        }
        DraftRound draftRoundFilter = new DraftRound(getHomeActivity());
        draftRoundFilter.setGame(getGame());
        draftRoundFilter.setRound(1);
        draftRoundFilter.getTeamUser().setId(team.getId());
        List<DraftRound> draftRoundList = BlankDao.getSome(draftRoundFilter);
        for (DraftRound draftRound : draftRoundList) {
            playersAndDraftRounds.add(draftRound);
        }
        return playersAndDraftRounds;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public SeparatedListAdapter getAdapter() {
        int teamId = BlankObj.toInteger(Integer.valueOf(BlankSharedPreferences.getInt(getHomeActivity(), this.FILTER_SHARED_PREFERENCE, 0))).intValue();
        Player playerFilter = new Player(getHomeActivity());
        playerFilter.getTeam().setId(Integer.valueOf(teamId));
        List<Player> auxPlayerList = BlankDao.getSome(playerFilter);
        List<Player> playerList = new ArrayList<>();
        for (Player player : auxPlayerList) {
            if (teamId == getGame().getUserTeam().getId().intValue()) {
                if (getTrade().getPlayerA1().getId() == null || player.getId().intValue() != getTrade().getPlayerA1().getId().intValue()) {
                    if (getTrade().getPlayerA2().getId() == null || player.getId().intValue() != getTrade().getPlayerA2().getId().intValue()) {
                        if (getTrade().getPlayerA3().getId() == null || player.getId().intValue() != getTrade().getPlayerA3().getId().intValue()) {
                            playerList.add(player);
                        }
                    }
                }
            } else if (getTrade().getPlayerB1().getId() == null || player.getId().intValue() != getTrade().getPlayerB1().getId().intValue()) {
                if (getTrade().getPlayerB2().getId() == null || player.getId().intValue() != getTrade().getPlayerB2().getId().intValue()) {
                    if (getTrade().getPlayerB3().getId() == null || player.getId().intValue() != getTrade().getPlayerB3().getId().intValue()) {
                        playerList.add(player);
                    }
                }
            }
        }
        Collections.sort(playerList, new PlayerComparator(1, -1));
        DraftRound draftRoundFilter = new DraftRound(getHomeActivity());
        draftRoundFilter.setGame(getGame());
        draftRoundFilter.setRound(1);
        draftRoundFilter.getTeamUser().setId(Integer.valueOf(teamId));
        List<DraftRound> auxDraftRoundList = BlankDao.getSome(draftRoundFilter);
        List<DraftRound> draftRoundList = new ArrayList<>();
        for (DraftRound draftRound : auxDraftRoundList) {
            if (teamId == getGame().getUserTeam().getId().intValue()) {
                if (getTrade().getDraftRoundA1().getId() == null || draftRound.getId().intValue() != getTrade().getDraftRoundA1().getId().intValue()) {
                    if (getTrade().getDraftRoundA2().getId() == null || draftRound.getId().intValue() != getTrade().getDraftRoundA2().getId().intValue()) {
                        if (getTrade().getDraftRoundA3().getId() == null || draftRound.getId().intValue() != getTrade().getDraftRoundA3().getId().intValue()) {
                            draftRoundList.add(draftRound);
                        }
                    }
                }
            } else if (getTrade().getDraftRoundB1().getId() == null || draftRound.getId().intValue() != getTrade().getDraftRoundB1().getId().intValue()) {
                if (getTrade().getDraftRoundB2().getId() == null || draftRound.getId().intValue() != getTrade().getDraftRoundB2().getId().intValue()) {
                    if (getTrade().getDraftRoundB3().getId() == null || draftRound.getId().intValue() != getTrade().getDraftRoundB3().getId().intValue()) {
                        draftRoundList.add(draftRound);
                    }
                }
            }
        }
        SeparatedListAdapter separatedAdapter = new SeparatedListAdapter(getHomeActivity());
        AdapterPlayerTradeList adapterPlayer = new AdapterPlayerTradeList(getHomeActivity(), R.layout.spinner_player, playerList);
        separatedAdapter.addSection(getResources().getString(R.string.trade_players), adapterPlayer);
        if (!draftRoundList.isEmpty()) {
            AdapterDraftRoundList adapterDrawer = new AdapterDraftRoundList(getHomeActivity(), R.layout.spinner_string, draftRoundList);
            separatedAdapter.addSection(getResources().getString(R.string.trade_draft_rounds), adapterDrawer);
        }
        return separatedAdapter;
    }

    private SeparatedListAdapter getTradeAdapter() {
        List<Player> playerList = new ArrayList<>();
        if (getTempTrade().getPlayerA1().getId() != null) {
            playerList.add(getTempTrade().getPlayerA1());
        }
        if (getTempTrade().getPlayerA2().getId() != null) {
            playerList.add(getTempTrade().getPlayerA2());
        }
        if (getTempTrade().getPlayerA3().getId() != null) {
            playerList.add(getTempTrade().getPlayerA3());
        }
        List<DraftRound> draftRoundList = new ArrayList<>();
        if (getTempTrade().getDraftRoundA1().getId() != null) {
            draftRoundList.add(getTempTrade().getDraftRoundA1());
        }
        if (getTempTrade().getDraftRoundA2().getId() != null) {
            draftRoundList.add(getTempTrade().getDraftRoundA2());
        }
        if (getTempTrade().getDraftRoundA3().getId() != null) {
            draftRoundList.add(getTempTrade().getDraftRoundA3());
        }
        SeparatedListAdapter separatedAdapter = new SeparatedListAdapter(getHomeActivity());
        if (!playerList.isEmpty()) {
            AdapterPlayerTradeList adapterPlayer = new AdapterPlayerTradeList(getHomeActivity(), R.layout.spinner_player, playerList);
            separatedAdapter.addSection(getResources().getString(R.string.trade_players), adapterPlayer);
        }
        if (!draftRoundList.isEmpty()) {
            AdapterDraftRoundList adapterDrawer = new AdapterDraftRoundList(getHomeActivity(), R.layout.spinner_string, draftRoundList);
            separatedAdapter.addSection(getResources().getString(R.string.trade_draft_rounds), adapterDrawer);
        }
        return separatedAdapter;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void saveTrade(Trade trade) {
        List<Player> savePlayerList = new ArrayList<>();
        List<DraftRound> saveDraftRoundList = new ArrayList<>();
        if (trade.getPlayerA1().getId() != null) {
            trade.getPlayerA1().setTeam(trade.getTeamB());
            savePlayerList.add(trade.getPlayerA1());
        }
        if (trade.getPlayerA2().getId() != null) {
            trade.getPlayerA2().setTeam(trade.getTeamB());
            savePlayerList.add(trade.getPlayerA2());
        }
        if (trade.getPlayerA3().getId() != null) {
            trade.getPlayerA3().setTeam(trade.getTeamB());
            savePlayerList.add(trade.getPlayerA3());
        }
        if (trade.getPlayerB1().getId() != null) {
            trade.getPlayerB1().setTeam(trade.getTeamA());
            savePlayerList.add(trade.getPlayerB1());
        }
        if (trade.getPlayerB2().getId() != null) {
            trade.getPlayerB2().setTeam(trade.getTeamA());
            savePlayerList.add(trade.getPlayerB2());
        }
        if (trade.getPlayerB3().getId() != null) {
            trade.getPlayerB3().setTeam(trade.getTeamA());
            savePlayerList.add(trade.getPlayerB3());
        }
        BlankDao.saveOrUpdateAll(savePlayerList);
        if (trade.getDraftRoundA1().getId() != null) {
            trade.getDraftRoundA1().setTeamUser(trade.getTeamB());
            saveDraftRoundList.add(trade.getDraftRoundA1());
        }
        if (trade.getDraftRoundA2().getId() != null) {
            trade.getDraftRoundA2().setTeamUser(trade.getTeamB());
            saveDraftRoundList.add(trade.getDraftRoundA2());
        }
        if (trade.getDraftRoundA3().getId() != null) {
            trade.getDraftRoundA3().setTeamUser(trade.getTeamB());
            saveDraftRoundList.add(trade.getDraftRoundA3());
        }
        if (trade.getDraftRoundB1().getId() != null) {
            trade.getDraftRoundB1().setTeamUser(trade.getTeamA());
            saveDraftRoundList.add(trade.getDraftRoundB1());
        }
        if (trade.getDraftRoundB2().getId() != null) {
            trade.getDraftRoundB2().setTeamUser(trade.getTeamA());
            saveDraftRoundList.add(trade.getDraftRoundB2());
        }
        if (trade.getDraftRoundB3().getId() != null) {
            trade.getDraftRoundB3().setTeamUser(trade.getTeamA());
            saveDraftRoundList.add(trade.getDraftRoundB3());
        }
        BlankDao.saveOrUpdateAll(saveDraftRoundList);
    }
}
