package com.blank.bm15.activity.fragment;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.TextView;
import com.blank.bm15.activity.adapter.AdapterOfferList;
import com.blank.bm15.activity.adapter.AdapterPlayerList;
import com.blank.bm15.activity.base.BaseFragment;
import com.blank.bm15.dao.BlankDao;
import com.blank.bm15.model.comparator.PlayerComparator;
import com.blank.bm15.model.object.crud.Offer;
import com.blank.bm15.model.object.crud.Player;
import com.blank.bm15.model.util.Alert;
import com.blank.bm15.model.util.Util;
import com.blank.bm15pro.R;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* loaded from: classes.dex */
public class RenewalsFragment extends BaseFragment {
    public static final RenewalsFragment newInstance(int fragmentLayout, Integer navigationMode) {
        RenewalsFragment fragment = new RenewalsFragment();
        Bundle args = new Bundle(2);
        args.putInt(FRAGMENT_LAYOUT, fragmentLayout);
        args.putInt(NAVIGATION_MODE, navigationMode.intValue());
        fragment.setArguments(args);
        return fragment;
    }

    @Override // com.blank.bm15.activity.base.BaseFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        loadList(this.rootView);
    }

    private void loadList(View rootView) {
        Player filter = new Player(getHomeActivity());
        filter.setGame(getGame());
        filter.setTeam(getGame().getUserTeam());
        filter.setYearsContract(0);
        List<Player> playerList = BlankDao.getSome(filter);
        Collections.sort(playerList, new PlayerComparator(0, -1));
        final ListView listView = (ListView) rootView.findViewById(R.id.fragmentLisView);
        listView.setAdapter((ListAdapter) new AdapterPlayerList(getHomeActivity(), R.layout.spinner_player, playerList, Boolean.FALSE.booleanValue()));
        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() { // from class: com.blank.bm15.activity.fragment.RenewalsFragment.1
            @Override // android.widget.AdapterView.OnItemClickListener
            public void onItemClick(AdapterView<?> arg0, View arg1, int position, long arg3) {
                final Player player = (Player) listView.getItemAtPosition(position);
                Offer filter2 = new Offer(RenewalsFragment.this.getHomeActivity());
                filter2.setGame(RenewalsFragment.this.getGame());
                filter2.setPlayer(player);
                filter2.setTeam(RenewalsFragment.this.getGame().getUserTeam());
                List<Offer> currentOfferList = BlankDao.getSome(filter2);
                for (Offer offer : currentOfferList) {
                    if (offer.getMatchday().intValue() != RenewalsFragment.this.getGame().getCurrentMatchday().intValue() - 1) {
                        if (offer.getSalary().intValue() >= RenewalsFragment.this.getGame().getCurrentMatchday().intValue()) {
                            Alert.showWarningDialog(RenewalsFragment.this.getHomeActivity(), String.format(RenewalsFragment.this.getResources().getString(R.string.warning_no_more_offers), offer.getPlayer().getShortName()));
                            return;
                        }
                    } else {
                        BlankDao.delete(offer);
                    }
                }
                AlertDialog.Builder builder = new AlertDialog.Builder(RenewalsFragment.this.getHomeActivity());
                LayoutInflater inflater = RenewalsFragment.this.getHomeActivity().getLayoutInflater();
                View dialogView = inflater.inflate(R.layout.dialog_select_offer, (ViewGroup) null);
                TextView textView = (TextView) dialogView.findViewById(R.id.dialogSelectOfferTextViewTitle);
                textView.setText(RenewalsFragment.this.getString(R.string.free_agent_offer));
                TextView textView2 = (TextView) dialogView.findViewById(R.id.dialogSelectOfferTextViewSubTitle);
                textView2.setText("(" + RenewalsFragment.this.getString(R.string.free_agent_salary_current) + ": " + Util.formatSalary(player.getSalary()) + ")");
                builder.setView(dialogView).setNegativeButton(RenewalsFragment.this.getString(R.string.button_cancel), new DialogInterface.OnClickListener() { // from class: com.blank.bm15.activity.fragment.RenewalsFragment.1.1
                    @Override // android.content.DialogInterface.OnClickListener
                    public void onClick(DialogInterface dialog, int id) {
                        dialog.cancel();
                    }
                });
                List<Offer> offerList = new ArrayList<>();
                offerList.add(FreeAgentsFragment.getOffer(RenewalsFragment.this.getGame(), player, Util.getRandomValue(-25, -16).intValue()));
                offerList.add(FreeAgentsFragment.getOffer(RenewalsFragment.this.getGame(), player, Util.getRandomValue(-15, -6).intValue()));
                offerList.add(FreeAgentsFragment.getOffer(RenewalsFragment.this.getGame(), player, Util.getRandomValue(-5, 5).intValue()));
                offerList.add(FreeAgentsFragment.getOffer(RenewalsFragment.this.getGame(), player, Util.getRandomValue(6, 15).intValue()));
                offerList.add(FreeAgentsFragment.getOffer(RenewalsFragment.this.getGame(), player, Util.getRandomValue(16, 25).intValue()));
                final ListView listView2 = (ListView) dialogView.findViewById(R.id.dialogSelectOfferListViewList);
                listView2.setAdapter((ListAdapter) new AdapterOfferList(RenewalsFragment.this.getHomeActivity(), R.layout.spinner_offer, offerList));
                listView2.setOnItemClickListener(new AdapterView.OnItemClickListener() { // from class: com.blank.bm15.activity.fragment.RenewalsFragment.1.2
                    @Override // android.widget.AdapterView.OnItemClickListener
                    public void onItemClick(AdapterView<?> arg02, View arg12, int position2, long arg32) {
                        Offer offer2 = (Offer) listView2.getItemAtPosition(position2);
                        offer2.setAnswer(Boolean.valueOf(Util.getRandomValue(0, 10).intValue() < player.getLoyalty().intValue() + position2));
                        offer2.setMatchday(RenewalsFragment.this.getGame().getCurrentMatchday());
                        BlankDao.saveOrUpdate(offer2);
                        RenewalsFragment.this.getHomeActivity().alertDialog.cancel();
                    }
                });
                RenewalsFragment.this.getHomeActivity().alertDialog = builder.create();
                RenewalsFragment.this.getHomeActivity().alertDialog.show();
            }
        });
    }
}
