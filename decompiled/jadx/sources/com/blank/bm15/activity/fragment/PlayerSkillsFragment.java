package com.blank.bm15.activity.fragment;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.SeekBar;
import android.widget.TextView;
import com.blank.bm15.activity.base.BaseActivity;
import com.blank.bm15.activity.base.BaseFragment;
import com.blank.bm15.dao.BlankDao;
import com.blank.bm15.dao.utils.BlankObj;
import com.blank.bm15.model.object.crud.Navigation;
import com.blank.bm15.model.object.crud.Player;
import com.blank.bm15.model.util.Util;
import com.blank.bm15pro.R;

/* JADX INFO: loaded from: classes.dex */
public class PlayerSkillsFragment extends BaseFragment {
    public static final PlayerSkillsFragment newInstance(int fragmentLayout) {
        PlayerSkillsFragment fragment = new PlayerSkillsFragment();
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
        final Player player = new Player(getHomeActivity());
        player.setId(navigation.getIdObject());
        BlankDao.loadById(player);
        loadHeader(player);
        TextView textViewAverageAttack = (TextView) this.rootView.findViewById(R.id.fragmentPlayerSkillTextViewHabilitiesAttackValue);
        textViewAverageAttack.setText(BlankObj.toInteger(player.getAverageSkillAttack()).toString());
        TextView textViewAverageDefense = (TextView) this.rootView.findViewById(R.id.fragmentPlayerSkillTextViewHabilitiesDefenseValue);
        textViewAverageDefense.setText(BlankObj.toInteger(player.getAverageSkillDefense()).toString());
        loadSeekBar(this.rootView, player, player.getSkillPhysique(), R.id.fragmentPlayerSkillTextViewPhysiqueValue, R.id.fragmentPlayerSkillSeekBarPhysiqueValue);
        loadSeekBar(this.rootView, player, player.getSkillBlock(), R.id.fragmentPlayerSkillTextViewBlockValue, R.id.fragmentPlayerSkillSeekBarBlockValue);
        loadSeekBar(this.rootView, player, player.getSkillRebound(), R.id.fragmentPlayerSkillTextViewReboundValue, R.id.fragmentPlayerSkillSeekBarReboundValue);
        loadSeekBar(this.rootView, player, player.getSkillSteal(), R.id.fragmentPlayerSkillTextViewStealValue, R.id.fragmentPlayerSkillSeekBarStealValue);
        loadSeekBar(this.rootView, player, player.getSkillPass(), R.id.fragmentPlayerSkillTextViewPassValue, R.id.fragmentPlayerSkillSeekBarPassValue);
        loadSeekBar(this.rootView, player, player.getSkillShotInterior(), R.id.fragmentPlayerSkillTextViewShotIntValue, R.id.fragmentPlayerSkillSeekBarShotIntValue);
        loadSeekBar(this.rootView, player, player.getSkillShotExterior(), R.id.fragmentPlayerSkillTextViewShotExtValue, R.id.fragmentPlayerSkillSeekBarShotExtValue);
        loadSeekBar(this.rootView, player, player.getSkillShotFree(), R.id.fragmentPlayerSkillTextViewShotFreValue, R.id.fragmentPlayerSkillSeekBarShotFreValue);
        Button buttonExchangePositions = (Button) this.rootView.findViewById(R.id.fragmentPlayerSkillButtonExchangePositions);
        buttonExchangePositions.setOnClickListener(new View.OnClickListener() { // from class: com.blank.bm15.activity.fragment.PlayerSkillsFragment.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                int pos = player.getPositionSecond().intValue();
                player.setPositionSecond(player.getPositionFirst());
                player.setPositionFirst(Integer.valueOf(pos));
                BlankDao.saveOrUpdate(player);
                PlayerSkillsFragment.this.createPage();
            }
        });
        if (getGame() != null && getGame().getUserTeam() != null && getGame().getUserTeam().getId() != null && player != null && player.getTeam() != null && player.getTeam().getId() != null && getGame().getUserTeam().getId().intValue() == player.getTeam().getId().intValue() && player.getPositionSecond().intValue() != 0) {
            buttonExchangePositions.setVisibility(0);
        } else {
            buttonExchangePositions.setVisibility(8);
        }
    }

    private void loadSeekBar(View view, final Player player, Integer value, int textViewId, final int seekBarValueId) {
        final TextView textViewValue = (TextView) view.findViewById(textViewId);
        textViewValue.setText(BlankObj.toString(value));
        SeekBar seekBarValue = (SeekBar) view.findViewById(seekBarValueId);
        seekBarValue.setEnabled(Boolean.FALSE.booleanValue());
        seekBarValue.setMax(98);
        seekBarValue.setProgress(value.intValue() - 1);
        seekBarValue.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() { // from class: com.blank.bm15.activity.fragment.PlayerSkillsFragment.2
            @Override // android.widget.SeekBar.OnSeekBarChangeListener
            public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                int newValue = progress + 1;
                if (seekBarValueId == R.id.fragmentPlayerSkillSeekBarPhysiqueValue) {
                    player.setSkillPhysique(Integer.valueOf(newValue));
                } else if (seekBarValueId == R.id.fragmentPlayerSkillSeekBarBlockValue) {
                    player.setSkillBlock(Integer.valueOf(newValue));
                } else if (seekBarValueId == R.id.fragmentPlayerSkillSeekBarReboundValue) {
                    player.setSkillRebound(Integer.valueOf(newValue));
                } else if (seekBarValueId == R.id.fragmentPlayerSkillSeekBarStealValue) {
                    player.setSkillSteal(Integer.valueOf(newValue));
                } else if (seekBarValueId == R.id.fragmentPlayerSkillSeekBarPassValue) {
                    player.setSkillPass(Integer.valueOf(newValue));
                } else if (seekBarValueId == R.id.fragmentPlayerSkillSeekBarShotIntValue) {
                    player.setSkillShotInterior(Integer.valueOf(newValue));
                } else if (seekBarValueId == R.id.fragmentPlayerSkillSeekBarShotExtValue) {
                    player.setSkillShotExterior(Integer.valueOf(newValue));
                } else if (seekBarValueId == R.id.fragmentPlayerSkillSeekBarShotFreValue) {
                    player.setSkillShotFree(Integer.valueOf(newValue));
                }
                textViewValue.setText(BlankObj.toString(Integer.valueOf(newValue)));
                BlankDao.saveOrUpdate(player);
                PlayerSkillsFragment.this.updateAll(player);
            }

            @Override // android.widget.SeekBar.OnSeekBarChangeListener
            public void onStartTrackingTouch(SeekBar seekBar) {
            }

            @Override // android.widget.SeekBar.OnSeekBarChangeListener
            public void onStopTrackingTouch(SeekBar seekBar) {
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateAll(Player player) {
        TextView textViewAverageAttack = (TextView) this.rootView.findViewById(R.id.fragmentPlayerSkillTextViewHabilitiesAttackValue);
        textViewAverageAttack.setText(BlankObj.toInteger(player.getAverageSkillAttack()).toString());
        TextView textViewAverageDefense = (TextView) this.rootView.findViewById(R.id.fragmentPlayerSkillTextViewHabilitiesDefenseValue);
        textViewAverageDefense.setText(BlankObj.toInteger(player.getAverageSkillDefense()).toString());
    }

    private void loadHeader(Player player) {
        boolean showTeamName = Boolean.FALSE.booleanValue();
        if (player != null && player.getTeam().getId() != null && getGame().getUserTeam().getId() != null) {
            showTeamName = player.getTeam().getId().intValue() != getGame().getUserTeam().getId().intValue();
        }
        ImageView imageViewPotential = (ImageView) this.rootView.findViewById(R.id.playerImageViewPotential);
        TextView textViewName = (TextView) this.rootView.findViewById(R.id.playerTextViewName);
        TextView textViewAge = (TextView) this.rootView.findViewById(R.id.playerTextViewAgeValue);
        TextView textViewPositionFirst = (TextView) this.rootView.findViewById(R.id.playerTextViewPositionFirst);
        TextView textViewSeparatorPositionSecond = (TextView) this.rootView.findViewById(R.id.playerTextViewSeparatorPositionSecond);
        TextView textViewPositionSecond = (TextView) this.rootView.findViewById(R.id.playerTextViewPositionSecond);
        TextView textViewSeparatorPositionMatch = (TextView) this.rootView.findViewById(R.id.playerTextViewSeparatorPositionMatch);
        TextView textViewPositionMatch = (TextView) this.rootView.findViewById(R.id.playerTextViewPositionMatch);
        TextView textViewForm = (TextView) this.rootView.findViewById(R.id.playerTextViewFormValue);
        TextView textViewEnergy = (TextView) this.rootView.findViewById(R.id.playerTextViewEnergyValue);
        TextView textViewAverageText = (TextView) this.rootView.findViewById(R.id.playerTextViewAverageText);
        TextView textViewAverageValue = (TextView) this.rootView.findViewById(R.id.playerTextViewAverageValue);
        if (player.getStateInjury().intValue() > 0) {
            imageViewPotential.setImageDrawable(getHomeActivity().getResources().getDrawable(R.drawable.news_injured));
            textViewSeparatorPositionMatch.setVisibility(8);
            textViewPositionMatch.setVisibility(0);
            textViewPositionFirst.setVisibility(8);
            textViewSeparatorPositionSecond.setVisibility(8);
            textViewPositionSecond.setVisibility(8);
            if (player.getStateInjury().intValue() > 1) {
                textViewPositionMatch.setText(String.valueOf(getHomeActivity().getString(R.string.damage)) + " " + player.getStateInjury() + " " + getHomeActivity().getString(R.string.days));
            } else {
                textViewPositionMatch.setText(String.valueOf(getHomeActivity().getString(R.string.damage)) + " " + player.getStateInjury() + " " + getHomeActivity().getString(R.string.day));
            }
        } else {
            int potential = player.getPotential().intValue();
            if (potential >= 9) {
                imageViewPotential.setImageDrawable(getHomeActivity().getResources().getDrawable(R.drawable.star6));
            } else if (potential >= 7) {
                imageViewPotential.setImageDrawable(getHomeActivity().getResources().getDrawable(R.drawable.star5));
            } else if (potential >= 5) {
                imageViewPotential.setImageDrawable(getHomeActivity().getResources().getDrawable(R.drawable.star4));
            } else if (potential >= 3) {
                imageViewPotential.setImageDrawable(getHomeActivity().getResources().getDrawable(R.drawable.star3));
            } else if (potential >= 1) {
                imageViewPotential.setImageDrawable(getHomeActivity().getResources().getDrawable(R.drawable.star2));
            } else {
                imageViewPotential.setImageDrawable(getHomeActivity().getResources().getDrawable(R.drawable.star1));
            }
            textViewPositionFirst.setText(Util.getLongPositionString(getHomeActivity(), player.getPositionFirst()));
            if (player.getPositionSecond().intValue() != 0) {
                textViewSeparatorPositionSecond.setVisibility(0);
                textViewPositionSecond.setVisibility(0);
                textViewPositionSecond.setText(Util.getLongPositionString(getHomeActivity(), player.getPositionSecond()));
            } else {
                textViewSeparatorPositionSecond.setVisibility(8);
                textViewPositionSecond.setVisibility(8);
            }
            int posTitular = player.getTeam().getTactic().getTitularPosition(player).intValue();
            int posReserve = player.getTeam().getTactic().getReservePosition(player).intValue();
            if (!showTeamName && posTitular != 0) {
                if (posTitular == player.getPositionFirst().intValue()) {
                    textViewPositionFirst.setTextColor(getHomeActivity().getResources().getColor(R.color.holo_blue_dark));
                } else if (posTitular == player.getPositionSecond().intValue()) {
                    textViewPositionSecond.setTextColor(getHomeActivity().getResources().getColor(R.color.holo_blue_dark));
                } else {
                    textViewSeparatorPositionMatch.setVisibility(0);
                    textViewPositionMatch.setVisibility(0);
                    textViewPositionMatch.setText(Util.getLongPositionString(getHomeActivity(), Integer.valueOf(posTitular)));
                }
                textViewAverageText.setTextColor(getHomeActivity().getResources().getColor(R.color.holo_blue_dark));
                textViewAverageValue.setTextColor(getHomeActivity().getResources().getColor(R.color.holo_blue_dark));
            } else if (!showTeamName && posReserve != 0) {
                if (posReserve == player.getPositionFirst().intValue()) {
                    textViewPositionFirst.setTextColor(getHomeActivity().getResources().getColor(R.color.holo_green_dark));
                } else if (posReserve == player.getPositionSecond().intValue()) {
                    textViewPositionSecond.setTextColor(getHomeActivity().getResources().getColor(R.color.holo_green_dark));
                } else {
                    textViewSeparatorPositionMatch.setVisibility(0);
                    textViewPositionMatch.setVisibility(0);
                    textViewPositionMatch.setText(Util.getLongPositionString(getHomeActivity(), Integer.valueOf(posReserve)));
                }
                textViewAverageText.setTextColor(getHomeActivity().getResources().getColor(R.color.holo_green_dark));
                textViewAverageValue.setTextColor(getHomeActivity().getResources().getColor(R.color.holo_green_dark));
            }
        }
        String name = "";
        if (showTeamName) {
            if (player.getTeam().getId() == null) {
                name = String.valueOf("") + "(" + player.getContext().getString(R.string.free_agent) + ") ";
            } else {
                name = String.valueOf("") + "(" + player.getTeam().getName() + ") ";
            }
        }
        textViewName.setText(String.valueOf(name) + player.getName());
        textViewAge.setText(BlankObj.toString(player.getAge()));
        textViewForm.setText(BlankObj.toString(player.getStateForm()));
        textViewEnergy.setText(BlankObj.toString(player.getStateEnergy()));
        textViewAverageValue.setText(BlankObj.toInteger(player.getAverageSkillAll()).toString());
    }
}
