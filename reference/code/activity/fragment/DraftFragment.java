package com.blank.bm15.activity.fragment;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListAdapter;
import android.widget.ListView;
import com.blank.bm15.activity.adapter.AdapterDraftList;
import com.blank.bm15.activity.base.BaseFragment;
import com.blank.bm15.dao.BlankDao;
import com.blank.bm15.dao.BlankDaoExtra;
import com.blank.bm15.model.comparator.DraftRoundComparator;
import com.blank.bm15.model.comparator.PlayerComparator;
import com.blank.bm15.model.core.ManageDraft;
import com.blank.bm15.model.object.crud.DraftRound;
import com.blank.bm15.model.object.crud.Player;
import com.blank.bm15.model.util.Alert;
import com.blank.bm15pro.R;
import java.util.Collections;
import java.util.List;

/* loaded from: classes.dex */
public class DraftFragment extends BaseFragment {
    public static final DraftFragment newInstance(int fragmentLayout, Integer navigationMode) {
        DraftFragment fragment = new DraftFragment();
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

    /* JADX INFO: Access modifiers changed from: private */
    public void loadList(final View rootView) {
        Player filter = new Player(getHomeActivity());
        filter.setGame(getGame());
        List<Player> playerList = BlankDaoExtra.getDraftPlayers(filter);
        Collections.sort(playerList, new PlayerComparator(0, -1));
        final ListView listView = (ListView) rootView.findViewById(R.id.fragmentLisView);
        listView.setAdapter((ListAdapter) new AdapterDraftList(getHomeActivity(), R.layout.spinner_draft, playerList));
        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() { // from class: com.blank.bm15.activity.fragment.DraftFragment.1
            @Override // android.widget.AdapterView.OnItemClickListener
            public void onItemClick(AdapterView<?> arg0, View arg1, int position, long arg3) {
                Player player = (Player) listView.getItemAtPosition(position);
                int round = DraftFragment.this.getGame().getCurrentMatchday().intValue() == 232 ? 1 : 2;
                DraftRound draftRoundFilter = new DraftRound(DraftFragment.this.getHomeActivity());
                draftRoundFilter.setGame(DraftFragment.this.getGame());
                draftRoundFilter.setRound(Integer.valueOf(round));
                List<DraftRound> draftRoundList = BlankDao.getSome(draftRoundFilter);
                Collections.sort(draftRoundList, new DraftRoundComparator(0, 1));
                if (draftRoundList.isEmpty() || draftRoundList.get(0).getTeamUser().getId().intValue() != DraftFragment.this.getGame().getUserTeam().getId().intValue()) {
                    DraftFragment.this.createNoMorePicksAlert(rootView, player, round);
                } else {
                    DraftFragment.this.createSelectPlayerAlert(rootView, player, round, draftRoundList.get(0));
                }
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void createNoMorePicksAlert(View rootView, Player player, int round) {
        AlertDialog.Builder builder = Alert.getBuilder(getHomeActivity());
        builder.setTitle(getString(R.string.warning_title)).setMessage(String.format(getString(R.string.warning_draft_no_more_picks), player.getName())).setCancelable(false).setIcon(R.drawable.ic_warning).setNegativeButton(getString(R.string.button_cancel), new DialogInterface.OnClickListener() { // from class: com.blank.bm15.activity.fragment.DraftFragment.2
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int id) {
                dialog.cancel();
            }
        });
        getHomeActivity().alertDialog = builder.create();
        getHomeActivity().alertDialog.show();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void createSelectPlayerAlert(final View rootView, final Player player, final int round, final DraftRound draftRound) {
        AlertDialog.Builder builder = Alert.getBuilder(getHomeActivity());
        builder.setTitle(getString(R.string.warning_title)).setMessage(String.format(getString(R.string.warning_draft_select), player.getName())).setCancelable(false).setIcon(R.drawable.ic_warning).setPositiveButton(getString(R.string.button_accept), new DialogInterface.OnClickListener() { // from class: com.blank.bm15.activity.fragment.DraftFragment.3
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int id) {
                player.setTeam(DraftFragment.this.getGame().getUserTeam());
                ManageDraft.setDraftPlayerSalaryAndYearsContract(player, round, draftRound.getPosition().intValue());
                BlankDao.saveOrUpdate(player);
                BlankDao.delete(draftRound);
                ManageDraft.playDraft(DraftFragment.this.getGame(), round, Boolean.TRUE.booleanValue());
                DraftFragment.this.loadList(rootView);
            }
        }).setNegativeButton(getString(R.string.button_cancel), new DialogInterface.OnClickListener() { // from class: com.blank.bm15.activity.fragment.DraftFragment.4
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int id) {
                dialog.cancel();
            }
        });
        getHomeActivity().alertDialog = builder.create();
        getHomeActivity().alertDialog.show();
    }
}
