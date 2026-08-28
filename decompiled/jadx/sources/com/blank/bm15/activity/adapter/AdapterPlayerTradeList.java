package com.blank.bm15.activity.adapter;

import android.app.Activity;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.blank.bm15.dao.utils.BlankObj;
import com.blank.bm15.model.object.crud.Player;
import com.blank.bm15.model.util.Util;
import com.blank.bm15pro.R;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class AdapterPlayerTradeList extends ArrayAdapter<Player> {
    private Context context;
    private int layoutId;
    private List<Player> playerList;

    public AdapterPlayerTradeList(Context context, int layoutId, List<Player> playerList) {
        super(context, layoutId, playerList);
        this.playerList = null;
        this.context = context;
        this.layoutId = layoutId;
        this.playerList = playerList;
    }

    @Override // android.widget.ArrayAdapter, android.widget.Adapter
    public Player getItem(int position) {
        return this.playerList.get(position);
    }

    @Override // android.widget.ArrayAdapter, android.widget.Adapter
    public View getView(int position, View convertView, ViewGroup parent) {
        PlayerHolder holder;
        View row = convertView;
        if (row == null) {
            LayoutInflater inflater = ((Activity) this.context).getLayoutInflater();
            row = inflater.inflate(this.layoutId, parent, false);
            holder = new PlayerHolder();
            holder.imageViewPotential = (ImageView) row.findViewById(R.id.spinnerPlayerImageViewPotential);
            holder.textViewName = (TextView) row.findViewById(R.id.spinnerPlayerTextViewName);
            holder.relativeLayoutAge = (RelativeLayout) row.findViewById(R.id.spinnerPlayerRelativeLayoutAge);
            holder.textViewAgeText = (TextView) row.findViewById(R.id.spinnerPlayerTextViewAgeText);
            holder.textViewAgeValue = (TextView) row.findViewById(R.id.spinnerPlayerTextViewAgeValue);
            holder.textViewPositionFirst = (TextView) row.findViewById(R.id.spinnerPlayerTextViewPositionFirst);
            holder.textViewSeparatorPositionSecond = (TextView) row.findViewById(R.id.spinnerPlayerTextViewSeparatorPositionSecond);
            holder.textViewPositionSecond = (TextView) row.findViewById(R.id.spinnerPlayerTextViewPositionSecond);
            holder.textViewSeparatorPositionMatch = (TextView) row.findViewById(R.id.spinnerPlayerTextViewSeparatorPositionMatch);
            holder.textViewPositionMatch = (TextView) row.findViewById(R.id.spinnerPlayerTextViewPositionMatch);
            holder.textViewFormText = (TextView) row.findViewById(R.id.spinnerPlayerTextViewFormText);
            holder.textViewFormValue = (TextView) row.findViewById(R.id.spinnerPlayerTextViewFormValue);
            holder.textViewEnergyText = (TextView) row.findViewById(R.id.spinnerPlayerTextViewEnergyText);
            holder.textViewEnergyValue = (TextView) row.findViewById(R.id.spinnerPlayerTextViewEnergyValue);
            holder.textViewAverageText = (TextView) row.findViewById(R.id.spinnerPlayerTextViewAverageText);
            holder.textViewAverageValue = (TextView) row.findViewById(R.id.spinnerPlayerTextViewAverageValue);
            row.setTag(holder);
        } else {
            holder = (PlayerHolder) row.getTag();
        }
        Player player = this.playerList.get(position);
        holder.textViewPositionFirst.setTextColor(this.context.getResources().getColor(R.color.base_gray_dark));
        holder.textViewPositionSecond.setTextColor(this.context.getResources().getColor(R.color.base_gray_dark));
        holder.textViewAverageText.setTextColor(this.context.getResources().getColor(R.color.base_gray_dark));
        holder.textViewAverageValue.setTextColor(this.context.getResources().getColor(R.color.base_gray_dark));
        holder.textViewSeparatorPositionMatch.setVisibility(8);
        holder.textViewPositionMatch.setVisibility(8);
        if (player.getStateInjury().intValue() > 0) {
            holder.imageViewPotential.setImageDrawable(this.context.getResources().getDrawable(R.drawable.news_injured));
            holder.textViewSeparatorPositionMatch.setVisibility(8);
            holder.textViewPositionMatch.setVisibility(0);
            holder.textViewPositionFirst.setVisibility(8);
            holder.textViewSeparatorPositionSecond.setVisibility(8);
            holder.textViewPositionSecond.setVisibility(8);
            if (player.getStateInjury().intValue() > 1) {
                holder.textViewPositionMatch.setText(String.valueOf(this.context.getResources().getString(R.string.damage)) + " " + player.getStateInjury() + " " + this.context.getResources().getString(R.string.days));
            } else {
                holder.textViewPositionMatch.setText(String.valueOf(this.context.getResources().getString(R.string.damage)) + " " + player.getStateInjury() + " " + this.context.getResources().getString(R.string.day));
            }
        } else {
            int potential = player.getPotential().intValue();
            if (potential >= 9) {
                holder.imageViewPotential.setImageDrawable(this.context.getResources().getDrawable(R.drawable.star6));
            } else if (potential >= 7) {
                holder.imageViewPotential.setImageDrawable(this.context.getResources().getDrawable(R.drawable.star5));
            } else if (potential >= 5) {
                holder.imageViewPotential.setImageDrawable(this.context.getResources().getDrawable(R.drawable.star4));
            } else if (potential >= 3) {
                holder.imageViewPotential.setImageDrawable(this.context.getResources().getDrawable(R.drawable.star3));
            } else if (potential >= 1) {
                holder.imageViewPotential.setImageDrawable(this.context.getResources().getDrawable(R.drawable.star2));
            } else {
                holder.imageViewPotential.setImageDrawable(this.context.getResources().getDrawable(R.drawable.star1));
            }
            holder.textViewPositionFirst.setText(Util.getLongPositionString((Activity) this.context, player.getPositionFirst()));
            if (player.getPositionSecond().intValue() != 0) {
                holder.textViewSeparatorPositionSecond.setVisibility(0);
                holder.textViewPositionSecond.setVisibility(0);
                holder.textViewPositionSecond.setText(Util.getLongPositionString((Activity) this.context, player.getPositionSecond()));
            } else {
                holder.textViewSeparatorPositionSecond.setVisibility(8);
                holder.textViewPositionSecond.setVisibility(8);
            }
            int posTitular = player.getTeam().getTactic().getTitularPosition(player).intValue();
            int posReserve = player.getTeam().getTactic().getReservePosition(player).intValue();
            if (posTitular != 0) {
                holder.textViewAverageText.setTextColor(this.context.getResources().getColor(R.color.holo_blue_dark));
                holder.textViewAverageValue.setTextColor(this.context.getResources().getColor(R.color.holo_blue_dark));
            } else if (posReserve != 0) {
                holder.textViewAverageText.setTextColor(this.context.getResources().getColor(R.color.holo_green_dark));
                holder.textViewAverageValue.setTextColor(this.context.getResources().getColor(R.color.holo_green_dark));
            }
        }
        holder.textViewName.setText(player.getShortName());
        holder.relativeLayoutAge.getLayoutParams().width = 140;
        holder.textViewAgeText.setText(this.context.getString(R.string.spinner_player_salary));
        holder.textViewAgeValue.setText(BlankObj.toString(String.valueOf(Util.round(new Double(player.getSalary().intValue()).doubleValue() / 1000000.0d)) + "M"));
        holder.textViewFormText.setText(this.context.getString(R.string.spinner_player_years_contract));
        holder.textViewFormValue.setText(BlankObj.toString(player.getYearsContract()));
        holder.textViewEnergyText.setText(this.context.getString(R.string.spinner_player_age));
        holder.textViewEnergyValue.setText(BlankObj.toString(player.getAge()));
        holder.textViewAverageValue.setText(BlankObj.toInteger(player.getAverageSkillAll()).toString());
        changeBackgroundColor(row, position);
        return row;
    }

    private void changeBackgroundColor(View row, int position) {
        if (position % 2 == 0) {
            row.setBackgroundResource(R.color.adapter_even);
        } else {
            row.setBackgroundResource(R.color.adapter_odd);
        }
    }

    static class PlayerHolder {
        public ImageView imageViewPotential;
        public RelativeLayout relativeLayoutAge;
        public TextView textViewAgeText;
        public TextView textViewAgeValue;
        public TextView textViewAverageText;
        public TextView textViewAverageValue;
        public TextView textViewEnergyText;
        public TextView textViewEnergyValue;
        public TextView textViewFormText;
        public TextView textViewFormValue;
        public TextView textViewName;
        public TextView textViewPositionFirst;
        public TextView textViewPositionMatch;
        public TextView textViewPositionSecond;
        public TextView textViewSeparatorPositionMatch;
        public TextView textViewSeparatorPositionSecond;

        PlayerHolder() {
        }
    }
}
