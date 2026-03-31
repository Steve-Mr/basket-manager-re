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
import android.widget.SeekBar;
import com.blank.bm15.activity.adapter.AdapterPlayerList;
import com.blank.bm15.activity.base.BaseActivity;
import com.blank.bm15.activity.base.BaseFragment;
import com.blank.bm15.dao.BlankDao;
import com.blank.bm15.dao.utils.BlankObj;
import com.blank.bm15.model.comparator.PlayerComparator;
import com.blank.bm15.model.object.crud.Navigation;
import com.blank.bm15.model.object.crud.Player;
import com.blank.bm15.model.object.crud.Team;
import com.blank.bm15pro.R;
import java.util.Collections;

/* loaded from: classes.dex */
public class TeamTacticFragment extends BaseFragment {
    public static final TeamTacticFragment newInstance(int fragmentLayout) {
        TeamTacticFragment fragment = new TeamTacticFragment();
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
        SeekBar seekBarGameType = (SeekBar) this.rootView.findViewById(R.id.teamTacticSeekBarGameType);
        seekBarGameType.setMax(4);
        seekBarGameType.setProgress(team.getTactic().getTacticGameType().intValue() + 2);
        seekBarGameType.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() { // from class: com.blank.bm15.activity.fragment.TeamTacticFragment.1
            @Override // android.widget.SeekBar.OnSeekBarChangeListener
            public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                team.getTactic().setTacticGameType(Integer.valueOf(progress - 2));
                BlankDao.saveOrUpdate(team.getTactic());
            }

            @Override // android.widget.SeekBar.OnSeekBarChangeListener
            public void onStartTrackingTouch(SeekBar seekBar) {
            }

            @Override // android.widget.SeekBar.OnSeekBarChangeListener
            public void onStopTrackingTouch(SeekBar seekBar) {
            }
        });
        SeekBar seekBarBenchImportance = (SeekBar) this.rootView.findViewById(R.id.teamTacticSeekBarBenchImportance);
        seekBarBenchImportance.setMax(4);
        seekBarBenchImportance.setProgress(team.getTactic().getTacticBenchImportance().intValue() - 1);
        seekBarBenchImportance.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() { // from class: com.blank.bm15.activity.fragment.TeamTacticFragment.2
            @Override // android.widget.SeekBar.OnSeekBarChangeListener
            public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                team.getTactic().setTacticBenchImportance(Integer.valueOf(progress + 1));
                BlankDao.saveOrUpdate(team.getTactic());
            }

            @Override // android.widget.SeekBar.OnSeekBarChangeListener
            public void onStartTrackingTouch(SeekBar seekBar) {
            }

            @Override // android.widget.SeekBar.OnSeekBarChangeListener
            public void onStopTrackingTouch(SeekBar seekBar) {
            }
        });
        SeekBar seekBarShotIntPercent = (SeekBar) this.rootView.findViewById(R.id.teamTacticSeekBarShotIntPercent);
        seekBarShotIntPercent.setMax(10);
        seekBarShotIntPercent.setProgress(team.getTactic().getTacticShotIntPercent().intValue() - 35);
        seekBarShotIntPercent.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() { // from class: com.blank.bm15.activity.fragment.TeamTacticFragment.3
            @Override // android.widget.SeekBar.OnSeekBarChangeListener
            public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                team.getTactic().setTacticShotIntPercent(Integer.valueOf(progress + 35));
                BlankDao.saveOrUpdate(team.getTactic());
            }

            @Override // android.widget.SeekBar.OnSeekBarChangeListener
            public void onStartTrackingTouch(SeekBar seekBar) {
            }

            @Override // android.widget.SeekBar.OnSeekBarChangeListener
            public void onStopTrackingTouch(SeekBar seekBar) {
            }
        });
        SeekBar seekBarShotTriplePercent = (SeekBar) this.rootView.findViewById(R.id.teamTacticSeekBarShotTriplePercent);
        seekBarShotTriplePercent.setMax(10);
        seekBarShotTriplePercent.setProgress(team.getTactic().getTacticShotTriplePercent().intValue() - 35);
        seekBarShotTriplePercent.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() { // from class: com.blank.bm15.activity.fragment.TeamTacticFragment.4
            @Override // android.widget.SeekBar.OnSeekBarChangeListener
            public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                team.getTactic().setTacticShotTriplePercent(Integer.valueOf(progress + 35));
                BlankDao.saveOrUpdate(team.getTactic());
            }

            @Override // android.widget.SeekBar.OnSeekBarChangeListener
            public void onStartTrackingTouch(SeekBar seekBar) {
            }

            @Override // android.widget.SeekBar.OnSeekBarChangeListener
            public void onStopTrackingTouch(SeekBar seekBar) {
            }
        });
        Button button = (Button) this.rootView.findViewById(R.id.teamTacticButtonStarOne);
        button.setContentDescription(BlankObj.toString(3));
        setTextButton(team, button);
        Button button2 = (Button) this.rootView.findViewById(R.id.teamTacticButtonStarTwo);
        button2.setContentDescription(BlankObj.toString(2));
        setTextButton(team, button2);
        Button button3 = (Button) this.rootView.findViewById(R.id.teamTacticButtonStarThree);
        button3.setContentDescription(BlankObj.toString(1));
        setTextButton(team, button3);
    }

    private void setTextButton(Team team, final Button button) {
        int importance = Integer.valueOf(BlankObj.toString(button.getContentDescription())).intValue();
        Player player = new Player(team.getContext());
        if (importance == 3 && team.getTactic().getTacticStarOne() != null) {
            player.setId(team.getTactic().getTacticStarOne());
        } else if (importance == 2 && team.getTactic().getTacticStarTwo() != null) {
            player.setId(team.getTactic().getTacticStarTwo());
        } else if (importance == 1 && team.getTactic().getTacticStarThree() != null) {
            player.setId(team.getTactic().getTacticStarThree());
        }
        if (player.getId() != null) {
            BlankDao.loadById(player);
            button.setText(String.valueOf(player.getShortName()) + " (+" + importance + ")");
        } else if (importance == 3) {
            button.setText(team.getContext().getString(R.string.team_tactic_star_one));
        } else if (importance == 2) {
            button.setText(team.getContext().getString(R.string.team_tactic_star_two));
        } else if (importance == 1) {
            button.setText(team.getContext().getString(R.string.team_tactic_star_three));
        }
        button.setOnClickListener(new View.OnClickListener() { // from class: com.blank.bm15.activity.fragment.TeamTacticFragment.5
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                TeamTacticFragment.this.onClickTacticStarPlayers(button);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void onClickTacticStarPlayers(Button button) {
        Navigation navigation = BaseActivity.getNavigation(getHomeActivity());
        final Team team = new Team(getHomeActivity());
        team.setId(navigation.getIdObject());
        BlankDao.loadById(team);
        final int importance = Integer.valueOf(BlankObj.toString(button.getContentDescription())).intValue();
        AlertDialog.Builder builder = new AlertDialog.Builder(getHomeActivity());
        LayoutInflater inflater = getHomeActivity().getLayoutInflater();
        View dialogView = inflater.inflate(R.layout.dialog_team_players, (ViewGroup) null);
        builder.setView(dialogView).setPositiveButton(getString(R.string.button_remove), new DialogInterface.OnClickListener() { // from class: com.blank.bm15.activity.fragment.TeamTacticFragment.6
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int id) {
                if (importance == 3) {
                    team.getTactic().setTacticStarOne(null);
                } else if (importance == 2) {
                    team.getTactic().setTacticStarTwo(null);
                } else if (importance == 1) {
                    team.getTactic().setTacticStarThree(null);
                }
                BlankDao.saveOrUpdate(team.getTactic());
                TeamTacticFragment.this.createPage();
            }
        }).setNegativeButton(getString(R.string.button_cancel), new DialogInterface.OnClickListener() { // from class: com.blank.bm15.activity.fragment.TeamTacticFragment.7
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int id) {
                dialog.cancel();
            }
        });
        Collections.sort(team.getTactic().getPlayers(), new PlayerComparator(1, -1));
        final ListView listView = (ListView) dialogView.findViewById(R.id.dialogTeamPlayersListViewList);
        listView.setAdapter((ListAdapter) new AdapterPlayerList(getHomeActivity(), R.layout.spinner_player, team.getTactic().getPlayers(), Boolean.FALSE.booleanValue()));
        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() { // from class: com.blank.bm15.activity.fragment.TeamTacticFragment.8
            @Override // android.widget.AdapterView.OnItemClickListener
            public void onItemClick(AdapterView<?> arg0, View arg1, int position, long arg3) {
                Player player = (Player) listView.getItemAtPosition(position);
                if (importance == 3) {
                    team.getTactic().setTacticStarOne(player.getId());
                    if (team.getTactic().getTacticStarTwo() != null && team.getTactic().getTacticStarTwo().intValue() == player.getId().intValue()) {
                        team.getTactic().setTacticStarTwo(null);
                    } else if (team.getTactic().getTacticStarThree() != null && team.getTactic().getTacticStarThree().intValue() == player.getId().intValue()) {
                        team.getTactic().setTacticStarThree(null);
                    }
                } else if (importance == 2) {
                    team.getTactic().setTacticStarTwo(player.getId());
                    if (team.getTactic().getTacticStarOne() != null && team.getTactic().getTacticStarOne().intValue() == player.getId().intValue()) {
                        team.getTactic().setTacticStarOne(null);
                    } else if (team.getTactic().getTacticStarThree() != null && team.getTactic().getTacticStarThree().intValue() == player.getId().intValue()) {
                        team.getTactic().setTacticStarThree(null);
                    }
                } else if (importance == 1) {
                    team.getTactic().setTacticStarThree(player.getId());
                    if (team.getTactic().getTacticStarOne() != null && team.getTactic().getTacticStarOne().intValue() == player.getId().intValue()) {
                        team.getTactic().setTacticStarOne(null);
                    } else if (team.getTactic().getTacticStarTwo() != null && team.getTactic().getTacticStarTwo().intValue() == player.getId().intValue()) {
                        team.getTactic().setTacticStarTwo(null);
                    }
                }
                BlankDao.saveOrUpdate(team.getTactic());
                TeamTacticFragment.this.getHomeActivity().alertDialog.cancel();
                TeamTacticFragment.this.createPage();
            }
        });
        getHomeActivity().alertDialog = builder.create();
        getHomeActivity().alertDialog.show();
    }
}
