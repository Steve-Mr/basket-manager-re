package com.blank.bm15.activity.adapter;

import android.app.Activity;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;
import com.blank.bm15.activity.HomeActivity;
import com.blank.bm15.dao.utils.BlankObj;
import com.blank.bm15.model.object.other.MatchPlayoffs;
import com.blank.bm15.model.util.Util;
import com.blank.bm15pro.R;
import java.util.List;

/* loaded from: classes.dex */
public class AdapterPlayoffsList extends ArrayAdapter<MatchPlayoffs> {
    private Context context;
    private int layoutId;
    private List<MatchPlayoffs> matchPlayoffsList;

    public AdapterPlayoffsList(Context context, int layoutId, List<MatchPlayoffs> playoffsList) {
        super(context, layoutId, playoffsList);
        this.matchPlayoffsList = null;
        this.context = context;
        this.layoutId = layoutId;
        this.matchPlayoffsList = playoffsList;
    }

    @Override // android.widget.ArrayAdapter, android.widget.Adapter
    public MatchPlayoffs getItem(int position) {
        return this.matchPlayoffsList.get(position);
    }

    @Override // android.widget.ArrayAdapter, android.widget.Adapter
    public View getView(int position, View convertView, ViewGroup parent) {
        PlayoffsHolder holder;
        View row = convertView;
        if (row == null) {
            LayoutInflater inflater = ((Activity) this.context).getLayoutInflater();
            row = inflater.inflate(this.layoutId, parent, false);
            holder = new PlayoffsHolder();
            holder.textViewConference = (TextView) row.findViewById(R.id.spinnerPlayoffsTextViewConference);
            holder.textViewTeam1Name = (TextView) row.findViewById(R.id.spinnerPlayoffsTextViewTeam1);
            holder.textViewTeam2Name = (TextView) row.findViewById(R.id.spinnerPlayoffsTextViewTeam2);
            holder.textViewTeam1Result = (TextView) row.findViewById(R.id.spinnerPlayoffsTextViewResult1);
            holder.textViewTeam2Result = (TextView) row.findViewById(R.id.spinnerPlayoffsTextViewResult2);
            row.setTag(holder);
        } else {
            holder = (PlayoffsHolder) row.getTag();
        }
        MatchPlayoffs matchPlayoffs = this.matchPlayoffsList.get(position);
        if (matchPlayoffs.getConference() != null) {
            holder.textViewConference.setText(Util.getConference((Activity) this.context, matchPlayoffs.getConference()));
        } else {
            holder.textViewConference.setText("");
        }
        if (matchPlayoffs.getTeamLocalPositionConference() != null) {
            holder.textViewTeam1Name.setText("(" + matchPlayoffs.getTeamLocalPositionConference() + ") " + matchPlayoffs.getTeamLocal().getName());
            holder.textViewTeam1Result.setText(BlankObj.toString(matchPlayoffs.getResultLocal()));
        } else {
            holder.textViewTeam1Name.setText("");
            holder.textViewTeam1Result.setText("");
        }
        if (matchPlayoffs.getTeamVisitorPositionConference() != null) {
            holder.textViewTeam2Name.setText(String.valueOf(matchPlayoffs.getTeamVisitor().getName()) + " (" + matchPlayoffs.getTeamVisitorPositionConference() + ")");
            holder.textViewTeam2Result.setText(BlankObj.toString(matchPlayoffs.getResultVisitor()));
        } else {
            holder.textViewTeam2Name.setText("");
            holder.textViewTeam2Result.setText("");
        }
        HomeActivity activity = (HomeActivity) this.context;
        if (matchPlayoffs.getTeamLocal().getId().intValue() == activity.getGame().getUserTeam().getId().intValue() || matchPlayoffs.getTeamVisitor().getId().intValue() == activity.getGame().getUserTeam().getId().intValue()) {
            row.setBackgroundResource(R.color.holo_blue_light);
        } else {
            changeBackgroundColor(row, position);
        }
        return row;
    }

    private void changeBackgroundColor(View row, int position) {
        if (position % 2 == 0) {
            row.setBackgroundResource(R.color.adapter_even);
        } else {
            row.setBackgroundResource(R.color.adapter_odd);
        }
    }

    /* loaded from: classes.dex */
    static class PlayoffsHolder {
        public TextView textViewConference;
        public TextView textViewTeam1Name;
        public TextView textViewTeam1Result;
        public TextView textViewTeam2Name;
        public TextView textViewTeam2Result;

        PlayoffsHolder() {
        }
    }
}
