package com.blank.bm15.activity.adapter;

import android.app.Activity;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;
import com.blank.bm15.dao.utils.BlankObj;
import com.blank.bm15.model.object.crud.Player;
import com.blank.bm15.model.util.Util;
import com.blank.bm15pro.R;
import java.util.List;

/* loaded from: classes.dex */
public class AdapterDraftList extends ArrayAdapter<Player> {
    private Context context;
    private List<Player> draftPlayerList;
    private int layoutId;

    public AdapterDraftList(Context context, int layoutId, List<Player> playerList) {
        super(context, layoutId, playerList);
        this.draftPlayerList = null;
        this.context = context;
        this.layoutId = layoutId;
        this.draftPlayerList = playerList;
    }

    @Override // android.widget.ArrayAdapter, android.widget.Adapter
    public Player getItem(int position) {
        return this.draftPlayerList.get(position);
    }

    @Override // android.widget.ArrayAdapter, android.widget.Adapter
    public View getView(int position, View convertView, ViewGroup parent) {
        PlayerHolder holder;
        View row = convertView;
        if (row == null) {
            LayoutInflater inflater = ((Activity) this.context).getLayoutInflater();
            row = inflater.inflate(this.layoutId, parent, false);
            holder = new PlayerHolder();
            holder.textViewName = (TextView) row.findViewById(R.id.spinnerDraftTextViewName);
            holder.textViewPosition = (TextView) row.findViewById(R.id.spinnerDraftTextViewPosition);
            holder.textViewPotential = (TextView) row.findViewById(R.id.spinnerDraftTextViewPotentialValue);
            holder.textViewAge = (TextView) row.findViewById(R.id.spinnerDraftTextViewAgeValue);
            holder.textViewAverageAttack = (TextView) row.findViewById(R.id.spinnerDraftTextViewAverageAttackValue);
            holder.textViewAverageDefense = (TextView) row.findViewById(R.id.spinnerDraftTextViewAverageDefenseValue);
            row.setTag(holder);
        } else {
            holder = (PlayerHolder) row.getTag();
        }
        Player player = this.draftPlayerList.get(position);
        holder.textViewName.setText(player.getName());
        holder.textViewPosition.setText(Util.getLongPositionString((Activity) this.context, player.getPositionFirst()));
        holder.textViewPotential.setText(roundPotential(player.getPotential().intValue()));
        holder.textViewAge.setText(BlankObj.toString(player.getAge()));
        holder.textViewAverageAttack.setText(roundAverage(player.getAverageSkillAttack().doubleValue()));
        holder.textViewAverageDefense.setText(roundAverage(player.getAverageSkillDefense().doubleValue()));
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

    private String roundPotential(int potential) {
        if (potential > 7) {
            return "A";
        }
        if (potential > 4) {
            return "B";
        }
        return "C";
    }

    private String roundAverage(double average) {
        if (average > 87.5d) {
            return "90";
        }
        if (average > 82.5d) {
            return "85";
        }
        if (average > 77.5d) {
            return "80";
        }
        if (average > 72.5d) {
            return "75";
        }
        if (average > 67.5d) {
            return "70";
        }
        if (average > 62.5d) {
            return "65";
        }
        if (average > 57.5d) {
            return "60";
        }
        if (average > 52.5d) {
            return "55";
        }
        if (average > 47.5d) {
            return "50";
        }
        if (average > 42.5d) {
            return "45";
        }
        return "40";
    }

    /* loaded from: classes.dex */
    static class PlayerHolder {
        public TextView textViewAge;
        public TextView textViewAverageAttack;
        public TextView textViewAverageDefense;
        public TextView textViewName;
        public TextView textViewPosition;
        public TextView textViewPotential;

        PlayerHolder() {
        }
    }
}
