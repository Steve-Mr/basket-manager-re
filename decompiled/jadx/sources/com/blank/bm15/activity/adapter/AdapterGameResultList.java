package com.blank.bm15.activity.adapter;

import android.app.Activity;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;
import com.blank.bm15.dao.utils.BlankObj;
import com.blank.bm15.model.object.crud.Match;
import com.blank.bm15pro.R;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class AdapterGameResultList extends ArrayAdapter<Match> {
    private Context context;
    private List<Match> gameResultList;
    private int layoutId;

    public AdapterGameResultList(Context context, int layoutId, List<Match> gameResultList) {
        super(context, layoutId, gameResultList);
        this.gameResultList = null;
        this.context = context;
        this.layoutId = layoutId;
        this.gameResultList = gameResultList;
    }

    @Override // android.widget.ArrayAdapter, android.widget.Adapter
    public Match getItem(int position) {
        return this.gameResultList.get(position);
    }

    @Override // android.widget.ArrayAdapter, android.widget.Adapter
    public View getView(int position, View convertView, ViewGroup parent) {
        MatchHolder holder;
        View row = convertView;
        if (row == null) {
            LayoutInflater inflater = ((Activity) this.context).getLayoutInflater();
            row = inflater.inflate(this.layoutId, parent, false);
            holder = new MatchHolder();
            holder.textViewTeamName = (TextView) row.findViewById(R.id.spinnerGameResultTextViewTeamName);
            holder.textViewQuarterOne = (TextView) row.findViewById(R.id.spinnerGameResultTextViewQuarterOne);
            holder.textViewQuarterTwo = (TextView) row.findViewById(R.id.spinnerGameResultTextViewQuarterTwo);
            holder.textViewQuarterThree = (TextView) row.findViewById(R.id.spinnerGameResultTextViewQuarterThree);
            holder.textViewQuarterFour = (TextView) row.findViewById(R.id.spinnerGameResultTextViewQuarterFour);
            holder.textViewQuarterExtension = (TextView) row.findViewById(R.id.spinnerGameResultTextViewExtension);
            holder.textViewQuarterTotal = (TextView) row.findViewById(R.id.spinnerGameResultTextViewTotal);
            row.setTag(holder);
        } else {
            holder = (MatchHolder) row.getTag();
        }
        Match match = this.gameResultList.get(position);
        if (match.getLocalExtension().intValue() > 0 || match.getVisitorExtension().intValue() > 0) {
            holder.textViewQuarterExtension.setVisibility(0);
        } else {
            holder.textViewQuarterExtension.setVisibility(8);
        }
        if (position == 0) {
            holder.textViewTeamName.setText(this.context.getString(R.string.name));
            holder.textViewQuarterOne.setText(this.context.getString(R.string.calendar_game_result_title_1));
            holder.textViewQuarterTwo.setText(this.context.getString(R.string.calendar_game_result_title_2));
            holder.textViewQuarterThree.setText(this.context.getString(R.string.calendar_game_result_title_3));
            holder.textViewQuarterFour.setText(this.context.getString(R.string.calendar_game_result_title_4));
            holder.textViewQuarterExtension.setText(this.context.getString(R.string.calendar_game_result_title_5));
            holder.textViewQuarterTotal.setText(this.context.getString(R.string.calendar_game_result_title_total));
            row.setBackgroundResource(R.color.holo_blue_light);
        } else if (position % 2 != 0) {
            holder.textViewTeamName.setText(match.getTeamLocal().getName());
            holder.textViewQuarterOne.setText(BlankObj.toString(match.getLocalQuarterFirst()));
            holder.textViewQuarterTwo.setText(BlankObj.toString(match.getLocalQuarterSecond()));
            holder.textViewQuarterThree.setText(BlankObj.toString(match.getLocalQuarterThird()));
            holder.textViewQuarterFour.setText(BlankObj.toString(match.getLocalQuarterFourth()));
            holder.textViewQuarterExtension.setText(BlankObj.toString(match.getLocalExtension()));
            holder.textViewQuarterTotal.setText(BlankObj.toString(match.getFinalResultLocal()));
            row.setBackgroundResource(R.color.adapter_even);
        } else {
            holder.textViewTeamName.setText(match.getTeamVisitor().getName());
            holder.textViewQuarterOne.setText(BlankObj.toString(match.getVisitorQuarterFirst()));
            holder.textViewQuarterTwo.setText(BlankObj.toString(match.getVisitorQuarterSecond()));
            holder.textViewQuarterThree.setText(BlankObj.toString(match.getVisitorQuarterThird()));
            holder.textViewQuarterFour.setText(BlankObj.toString(match.getVisitorQuarterFourth()));
            holder.textViewQuarterExtension.setText(BlankObj.toString(match.getVisitorExtension()));
            holder.textViewQuarterTotal.setText(BlankObj.toString(match.getFinalResultVisitor()));
            row.setBackgroundResource(R.color.adapter_odd);
        }
        return row;
    }

    static class MatchHolder {
        public TextView textViewQuarterExtension;
        public TextView textViewQuarterFour;
        public TextView textViewQuarterOne;
        public TextView textViewQuarterThree;
        public TextView textViewQuarterTotal;
        public TextView textViewQuarterTwo;
        public TextView textViewTeamName;

        MatchHolder() {
        }
    }
}
