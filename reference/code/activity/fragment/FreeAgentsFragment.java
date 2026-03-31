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
import com.blank.bm15.activity.adapter.AdapterOfferList;
import com.blank.bm15.activity.adapter.AdapterPlayerList;
import com.blank.bm15.activity.base.BaseFragment;
import com.blank.bm15.dao.BlankDao;
import com.blank.bm15.dao.BlankDaoExtra;
import com.blank.bm15.dao.utils.BlankSharedPreferences;
import com.blank.bm15.model.comparator.PlayerComparator;
import com.blank.bm15.model.core.ManageFreeAgency;
import com.blank.bm15.model.object.crud.Game;
import com.blank.bm15.model.object.crud.Offer;
import com.blank.bm15.model.object.crud.Player;
import com.blank.bm15.model.util.Alert;
import com.blank.bm15.model.util.Util;
import com.blank.bm15pro.R;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* loaded from: classes.dex */
public class FreeAgentsFragment extends BaseFragment {
    public static final String FILTER_SHARED_PREFERENCE = "FILTER_FREE_AGENTS";

    public static final FreeAgentsFragment newInstance(int fragmentLayout, Integer navigationMode) {
        FreeAgentsFragment fragment = new FreeAgentsFragment();
        Bundle args = new Bundle(2);
        args.putInt(FRAGMENT_LAYOUT, fragmentLayout);
        args.putInt(NAVIGATION_MODE, navigationMode.intValue());
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
        button.setOnClickListener(new View.OnClickListener() { // from class: com.blank.bm15.activity.fragment.FreeAgentsFragment.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                AlertDialog.Builder builder = new AlertDialog.Builder(FreeAgentsFragment.this.getHomeActivity());
                LayoutInflater inflater = FreeAgentsFragment.this.getHomeActivity().getLayoutInflater();
                View dialogView = inflater.inflate(R.layout.dialog_team_players, (ViewGroup) null);
                TextView title = (TextView) dialogView.findViewById(R.id.dialogTeamPlayersTextViewTitle);
                title.setText(FreeAgentsFragment.this.getString(R.string.button_filter_by));
                builder.setView(dialogView).setPositiveButton(FreeAgentsFragment.this.getString(R.string.button_remove), new DialogInterface.OnClickListener() { // from class: com.blank.bm15.activity.fragment.FreeAgentsFragment.1.1
                    @Override // android.content.DialogInterface.OnClickListener
                    public void onClick(DialogInterface dialog, int id) {
                        BlankSharedPreferences.setInt(FreeAgentsFragment.this.getHomeActivity(), FreeAgentsFragment.FILTER_SHARED_PREFERENCE, 0);
                        dialog.cancel();
                        FreeAgentsFragment.this.create();
                    }
                }).setNegativeButton(FreeAgentsFragment.this.getString(R.string.button_cancel), new DialogInterface.OnClickListener() { // from class: com.blank.bm15.activity.fragment.FreeAgentsFragment.1.2
                    @Override // android.content.DialogInterface.OnClickListener
                    public void onClick(DialogInterface dialog, int id) {
                        dialog.cancel();
                    }
                });
                List<String> orderTypes = new ArrayList<>();
                orderTypes.add(FreeAgentsFragment.this.getString(R.string.position_point_guard));
                orderTypes.add(FreeAgentsFragment.this.getString(R.string.position_shooting_guard));
                orderTypes.add(FreeAgentsFragment.this.getString(R.string.position_small_forward));
                orderTypes.add(FreeAgentsFragment.this.getString(R.string.position_power_forward));
                orderTypes.add(FreeAgentsFragment.this.getString(R.string.position_center));
                ListView listView = (ListView) dialogView.findViewById(R.id.dialogTeamPlayersListViewList);
                ArrayAdapter<String> adapter = new ArrayAdapter<>(FreeAgentsFragment.this.getHomeActivity(), android.R.layout.simple_list_item_1, orderTypes);
                listView.setAdapter((ListAdapter) adapter);
                listView.setOnItemClickListener(new AdapterView.OnItemClickListener() { // from class: com.blank.bm15.activity.fragment.FreeAgentsFragment.1.3
                    @Override // android.widget.AdapterView.OnItemClickListener
                    public void onItemClick(AdapterView<?> arg0, View arg1, int position, long arg3) {
                        BlankSharedPreferences.setInt(FreeAgentsFragment.this.getHomeActivity(), FreeAgentsFragment.FILTER_SHARED_PREFERENCE, position + 1);
                        FreeAgentsFragment.this.getHomeActivity().alertDialog.cancel();
                        FreeAgentsFragment.this.create();
                    }
                });
                FreeAgentsFragment.this.getHomeActivity().alertDialog = builder.create();
                FreeAgentsFragment.this.getHomeActivity().alertDialog.show();
            }
        });
        Player filter = new Player(getHomeActivity());
        filter.setGame(getGame());
        filter.setPositionFirst(orderBy == 0 ? null : Integer.valueOf(orderBy));
        final List<Player> playerList = BlankDaoExtra.getFreeAgents(filter);
        Collections.sort(playerList, new PlayerComparator(1, -1));
        getGame().getUserTeam().getTactic().reloadPlayers();
        final ListView listView = (ListView) this.rootView.findViewById(R.id.fragmentTop100ListViewPlayers);
        listView.setAdapter((ListAdapter) new AdapterPlayerList(getHomeActivity(), R.layout.spinner_player, playerList, Boolean.FALSE.booleanValue()));
        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() { // from class: com.blank.bm15.activity.fragment.FreeAgentsFragment.2
            @Override // android.widget.AdapterView.OnItemClickListener
            public void onItemClick(AdapterView<?> arg0, View arg1, int position, long arg3) {
                if (FreeAgentsFragment.this.getGame().getUserTeam().getTactic().getPlayers().size() >= 20) {
                    Alert.showWarningDialog(FreeAgentsFragment.this.getHomeActivity(), FreeAgentsFragment.this.getResources().getString(R.string.warning_max_players_in_team));
                    return;
                }
                final Player player = (Player) listView.getItemAtPosition(position);
                Offer filter2 = new Offer(FreeAgentsFragment.this.getHomeActivity());
                filter2.setGame(FreeAgentsFragment.this.getGame());
                filter2.setPlayer(player);
                filter2.setTeam(FreeAgentsFragment.this.getGame().getUserTeam());
                List<Offer> currentOfferList = BlankDao.getSome(filter2);
                for (Offer offer : currentOfferList) {
                    if (offer.getSalary().intValue() >= FreeAgentsFragment.this.getGame().getCurrentMatchday().intValue()) {
                        Alert.showWarningDialog(FreeAgentsFragment.this.getHomeActivity(), String.format(FreeAgentsFragment.this.getResources().getString(R.string.warning_no_more_offers), offer.getPlayer().getShortName()));
                        return;
                    }
                    BlankDao.delete(offer);
                }
                final Integer salaryAvailable = Integer.valueOf(FreeAgentsFragment.this.getGame().getUserTeam().getSalaryCap().intValue() - FreeAgentsFragment.this.getGame().getUserTeam().getTeamSalary(player).intValue());
                AlertDialog.Builder builder = new AlertDialog.Builder(FreeAgentsFragment.this.getHomeActivity());
                LayoutInflater inflater = FreeAgentsFragment.this.getHomeActivity().getLayoutInflater();
                View dialogView = inflater.inflate(R.layout.dialog_select_offer, (ViewGroup) null);
                TextView textView = (TextView) dialogView.findViewById(R.id.dialogSelectOfferTextViewTitle);
                textView.setText(FreeAgentsFragment.this.getString(R.string.free_agent_offer));
                TextView textView2 = (TextView) dialogView.findViewById(R.id.dialogSelectOfferTextViewSubTitle);
                textView2.setText("(" + FreeAgentsFragment.this.getString(R.string.free_agent_salary_available) + ": " + Util.formatSalary(salaryAvailable) + ")");
                builder.setView(dialogView).setNegativeButton(FreeAgentsFragment.this.getString(R.string.button_cancel), new DialogInterface.OnClickListener() { // from class: com.blank.bm15.activity.fragment.FreeAgentsFragment.2.1
                    @Override // android.content.DialogInterface.OnClickListener
                    public void onClick(DialogInterface dialog, int id) {
                        dialog.cancel();
                    }
                });
                List<Offer> offerList = new ArrayList<>();
                offerList.add(FreeAgentsFragment.getOffer(FreeAgentsFragment.this.getGame(), player, Util.getRandomValue(-25, -16).intValue()));
                offerList.add(FreeAgentsFragment.getOffer(FreeAgentsFragment.this.getGame(), player, Util.getRandomValue(-15, -6).intValue()));
                offerList.add(FreeAgentsFragment.getOffer(FreeAgentsFragment.this.getGame(), player, Util.getRandomValue(-5, 5).intValue()));
                offerList.add(FreeAgentsFragment.getOffer(FreeAgentsFragment.this.getGame(), player, Util.getRandomValue(6, 15).intValue()));
                offerList.add(FreeAgentsFragment.getOffer(FreeAgentsFragment.this.getGame(), player, Util.getRandomValue(16, 25).intValue()));
                final ListView listView2 = (ListView) dialogView.findViewById(R.id.dialogSelectOfferListViewList);
                listView2.setAdapter((ListAdapter) new AdapterOfferList(FreeAgentsFragment.this.getHomeActivity(), R.layout.spinner_offer, offerList));
                final List list = playerList;
                listView2.setOnItemClickListener(new AdapterView.OnItemClickListener() { // from class: com.blank.bm15.activity.fragment.FreeAgentsFragment.2.2
                    @Override // android.widget.AdapterView.OnItemClickListener
                    public void onItemClick(AdapterView<?> arg02, View arg12, int position2, long arg32) {
                        Offer offer2 = (Offer) listView2.getItemAtPosition(position2);
                        if (salaryAvailable.intValue() > offer2.getSalary().intValue() || offer2.getSalary().intValue() < 1000000) {
                            if (FreeAgentsFragment.this.getGame().getCurrentMatchday().intValue() != 234) {
                                offer2.setAnswer(Boolean.valueOf(Util.getRandomValue(0, 5).intValue() < position2));
                                offer2.setMatchday(Integer.valueOf(FreeAgentsFragment.this.getGame().getCurrentMatchday().intValue() + Util.getRandomValue(1, 3).intValue()));
                            } else {
                                player.getOfferList().add(offer2);
                                if (ManageFreeAgency.manageLastMathcdayOffers(FreeAgentsFragment.this.getGame(), list)) {
                                    Alert.showWarningDialog(FreeAgentsFragment.this.getHomeActivity(), String.format(FreeAgentsFragment.this.getHomeActivity().getString(R.string.notice_renewal_ok), player.getShortName()));
                                } else {
                                    Alert.showWarningDialog(FreeAgentsFragment.this.getHomeActivity(), String.format(FreeAgentsFragment.this.getHomeActivity().getString(R.string.notice_renewal_ko), player.getShortName()));
                                }
                                FreeAgentsFragment.this.create();
                            }
                            BlankDao.saveOrUpdate(offer2);
                            FreeAgentsFragment.this.getHomeActivity().alertDialog.cancel();
                        }
                    }
                });
                FreeAgentsFragment.this.getHomeActivity().alertDialog = builder.create();
                FreeAgentsFragment.this.getHomeActivity().alertDialog.show();
            }
        });
    }

    public static Offer getOffer(Game game, Player player, int percent) {
        Integer yearsContract;
        Integer salary = Util.getSalary(player);
        if (player.getAge().intValue() <= 25) {
            yearsContract = Util.getRandomValue(2, 4);
        } else if (player.getAge().intValue() <= 30) {
            yearsContract = Util.getRandomValue(1, 4);
        } else {
            yearsContract = player.getAge().intValue() <= 34 ? Util.getRandomValue(1, 3) : Util.getRandomValue(1, 2);
        }
        Offer offer = new Offer(game.getContext());
        offer.setPlayer(player);
        offer.setTeam(game.getUserTeam());
        offer.setGame(game);
        offer.setYears(yearsContract);
        Integer salary2 = Integer.valueOf(salary.intValue() + ((salary.intValue() * percent) / 100));
        if (game.getCurrentMatchday().intValue() != 234) {
            salary2 = Integer.valueOf((salary2.intValue() * 80) / 100);
        }
        offer.setSalary(Integer.valueOf(Math.abs(Integer.valueOf(Integer.valueOf(salary2.intValue() / 1000).intValue() * 1000).intValue())));
        return offer;
    }
}
