package com.blank.bm15.model.object.other;

import android.app.Activity;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import com.blank.bm15.dao.utils.BlankObj;
import com.blank.bm15.model.object.crud.Player;
import com.blank.bm15.model.util.Util;
import com.blank.bm15pro.R;

/* loaded from: classes.dex */
public class PlayerHolder {
    public ImageView imageViewPotential;
    private boolean showTeamName;
    public TextView textViewAge;
    public TextView textViewAverageText;
    public TextView textViewAverageValue;
    public TextView textViewEnergy;
    public TextView textViewForm;
    public TextView textViewName;
    public TextView textViewPositionFirst;
    public TextView textViewPositionMatch;
    public TextView textViewPositionSecond;
    public TextView textViewSeparatorPositionMatch;
    public TextView textViewSeparatorPositionSecond;
    private View view;

    public PlayerHolder(View view, boolean showTeamName) {
        this.view = view;
        this.showTeamName = showTeamName;
        this.imageViewPotential = (ImageView) view.findViewById(R.id.spinnerPlayerImageViewPotential);
        this.textViewName = (TextView) view.findViewById(R.id.spinnerPlayerTextViewName);
        this.textViewAge = (TextView) view.findViewById(R.id.spinnerPlayerTextViewAgeValue);
        this.textViewPositionFirst = (TextView) view.findViewById(R.id.spinnerPlayerTextViewPositionFirst);
        this.textViewSeparatorPositionSecond = (TextView) view.findViewById(R.id.spinnerPlayerTextViewSeparatorPositionSecond);
        this.textViewPositionSecond = (TextView) view.findViewById(R.id.spinnerPlayerTextViewPositionSecond);
        this.textViewSeparatorPositionMatch = (TextView) view.findViewById(R.id.spinnerPlayerTextViewSeparatorPositionMatch);
        this.textViewPositionMatch = (TextView) view.findViewById(R.id.spinnerPlayerTextViewPositionMatch);
        this.textViewForm = (TextView) view.findViewById(R.id.spinnerPlayerTextViewFormValue);
        this.textViewEnergy = (TextView) view.findViewById(R.id.spinnerPlayerTextViewEnergyValue);
        this.textViewAverageText = (TextView) view.findViewById(R.id.spinnerPlayerTextViewAverageText);
        this.textViewAverageValue = (TextView) view.findViewById(R.id.spinnerPlayerTextViewAverageValue);
    }

    public void load(Activity activity, Player player) {
        this.textViewPositionFirst.setTextColor(this.view.getResources().getColor(R.color.base_gray_dark));
        this.textViewPositionSecond.setTextColor(this.view.getResources().getColor(R.color.base_gray_dark));
        this.textViewAverageText.setTextColor(this.view.getResources().getColor(R.color.base_gray_dark));
        this.textViewAverageValue.setTextColor(this.view.getResources().getColor(R.color.base_gray_dark));
        this.textViewSeparatorPositionMatch.setVisibility(8);
        this.textViewPositionMatch.setVisibility(8);
        if (player.getStateInjury().intValue() > 0) {
            this.imageViewPotential.setImageDrawable(this.view.getResources().getDrawable(R.drawable.news_injured));
            this.textViewSeparatorPositionMatch.setVisibility(8);
            this.textViewPositionMatch.setVisibility(0);
            this.textViewPositionFirst.setVisibility(8);
            this.textViewSeparatorPositionSecond.setVisibility(8);
            this.textViewPositionSecond.setVisibility(8);
            if (player.getStateInjury().intValue() > 1) {
                this.textViewPositionMatch.setText(String.valueOf(this.view.getResources().getString(R.string.damage)) + " " + player.getStateInjury() + " " + this.view.getResources().getString(R.string.days));
            } else {
                this.textViewPositionMatch.setText(String.valueOf(this.view.getResources().getString(R.string.damage)) + " " + player.getStateInjury() + " " + this.view.getResources().getString(R.string.day));
            }
        } else {
            int potential = player.getPotential().intValue();
            if (potential >= 9) {
                this.imageViewPotential.setImageDrawable(this.view.getResources().getDrawable(R.drawable.star6));
            } else if (potential >= 7) {
                this.imageViewPotential.setImageDrawable(this.view.getResources().getDrawable(R.drawable.star5));
            } else if (potential >= 5) {
                this.imageViewPotential.setImageDrawable(this.view.getResources().getDrawable(R.drawable.star4));
            } else if (potential >= 3) {
                this.imageViewPotential.setImageDrawable(this.view.getResources().getDrawable(R.drawable.star3));
            } else if (potential >= 1) {
                this.imageViewPotential.setImageDrawable(this.view.getResources().getDrawable(R.drawable.star2));
            } else {
                this.imageViewPotential.setImageDrawable(this.view.getResources().getDrawable(R.drawable.star1));
            }
            this.textViewPositionFirst.setText(Util.getLongPositionString(activity, player.getPositionFirst()));
            if (player.getPositionSecond().intValue() != 0) {
                this.textViewSeparatorPositionSecond.setVisibility(0);
                this.textViewPositionSecond.setVisibility(0);
                this.textViewPositionSecond.setText(Util.getLongPositionString(activity, player.getPositionSecond()));
            } else {
                this.textViewSeparatorPositionSecond.setVisibility(8);
                this.textViewPositionSecond.setVisibility(8);
            }
            int posTitular = player.getTeam().getTactic().getTitularPosition(player).intValue();
            int posReserve = player.getTeam().getTactic().getReservePosition(player).intValue();
            if (!this.showTeamName && posTitular != 0) {
                if (posTitular == player.getPositionFirst().intValue()) {
                    this.textViewPositionFirst.setTextColor(this.view.getResources().getColor(R.color.holo_blue_dark));
                } else if (posTitular == player.getPositionSecond().intValue()) {
                    this.textViewPositionSecond.setTextColor(this.view.getResources().getColor(R.color.holo_blue_dark));
                } else {
                    this.textViewSeparatorPositionMatch.setVisibility(0);
                    this.textViewPositionMatch.setVisibility(0);
                    this.textViewPositionMatch.setText(Util.getLongPositionString(activity, Integer.valueOf(posTitular)));
                }
                this.textViewAverageText.setTextColor(this.view.getResources().getColor(R.color.holo_blue_dark));
                this.textViewAverageValue.setTextColor(this.view.getResources().getColor(R.color.holo_blue_dark));
            } else if (!this.showTeamName && posReserve != 0) {
                if (posReserve == player.getPositionFirst().intValue()) {
                    this.textViewPositionFirst.setTextColor(this.view.getResources().getColor(R.color.holo_green_dark));
                } else if (posReserve == player.getPositionSecond().intValue()) {
                    this.textViewPositionSecond.setTextColor(this.view.getResources().getColor(R.color.holo_green_dark));
                } else {
                    this.textViewSeparatorPositionMatch.setVisibility(0);
                    this.textViewPositionMatch.setVisibility(0);
                    this.textViewPositionMatch.setText(Util.getLongPositionString(activity, Integer.valueOf(posReserve)));
                }
                this.textViewAverageText.setTextColor(this.view.getResources().getColor(R.color.holo_green_dark));
                this.textViewAverageValue.setTextColor(this.view.getResources().getColor(R.color.holo_green_dark));
            }
        }
        String name = "";
        if (this.showTeamName) {
            if (player.getTeam().getId() == null) {
                name = String.valueOf("") + "(" + player.getContext().getString(R.string.free_agent) + ") ";
            } else {
                name = String.valueOf("") + "(" + player.getTeam().getName() + ") ";
            }
        }
        this.textViewName.setText(String.valueOf(name) + player.getShortName());
        this.textViewAge.setText(BlankObj.toString(player.getAge()));
        this.textViewForm.setText(BlankObj.toString(player.getStateForm()));
        this.textViewEnergy.setText(BlankObj.toString(player.getStateEnergy()));
        this.textViewAverageValue.setText(BlankObj.toInteger(player.getAverageSkillAll()).toString());
    }
}
