package com.blank.bm15.activity.adapter;

import android.app.Activity;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;
import com.blank.bm15.activity.base.BaseActivity;
import com.blank.bm15.dao.utils.BlankObj;
import com.blank.bm15.model.object.crud.Match;
import com.blank.bm15pro.R;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class AdapterMatchList extends ArrayAdapter<Match> {
    private Context context;
    private int layoutId;
    private List<Match> matchList;

    public AdapterMatchList(Context context, int layoutId, List<Match> matchList) {
        super(context, layoutId, matchList);
        this.matchList = null;
        this.context = context;
        this.layoutId = layoutId;
        this.matchList = matchList;
    }

    @Override // android.widget.ArrayAdapter, android.widget.Adapter
    public Match getItem(int position) {
        return this.matchList.get(position);
    }

    @Override // android.widget.ArrayAdapter, android.widget.Adapter
    public View getView(int position, View convertView, ViewGroup parent) {
        MatchHolder holder;
        View row = convertView;
        if (row == null) {
            LayoutInflater inflater = ((Activity) this.context).getLayoutInflater();
            row = inflater.inflate(this.layoutId, parent, false);
            holder = new MatchHolder();
            holder.textViewTeamLocalName = (TextView) row.findViewById(R.id.spinnerMatchTextViewTeamLocalName);
            holder.textViewTeamVisitorName = (TextView) row.findViewById(R.id.spinnerMatchTextViewTeamVisitorName);
            holder.textViewSeparator = (TextView) row.findViewById(R.id.spinnerMatchTextViewSeparator);
            holder.textViewTeamLocalResult = (TextView) row.findViewById(R.id.spinnerMatchTextViewTeamLocalResult);
            holder.textViewTeamVisitorResult = (TextView) row.findViewById(R.id.spinnerMatchTextViewTeamVisitorResult);
            row.setTag(holder);
        } else {
            holder = (MatchHolder) row.getTag();
        }
        Match match = this.matchList.get(position);
        if (match.getLocalExtension().intValue() > 0 || match.getVisitorExtension().intValue() > 0) {
            holder.textViewSeparator.setTextColor(getActivity().getResources().getColor(R.color.holo_red_dark));
        } else {
            holder.textViewSeparator.setTextColor(getActivity().getResources().getColor(R.color.base_gray_very_dark));
        }
        holder.textViewTeamLocalName.setText(match.getTeamLocal().getFullName());
        holder.textViewTeamVisitorName.setText(match.getTeamVisitor().getFullName());
        holder.textViewTeamLocalResult.setText(BlankObj.toString(match.getFinalResultLocal()));
        holder.textViewTeamVisitorResult.setText(BlankObj.toString(match.getFinalResultVisitor()));
        holder.textViewTeamLocalName.setTextColor(getActivity().getResources().getColor(R.color.base_gray_very_dark));
        holder.textViewTeamLocalResult.setTextColor(getActivity().getResources().getColor(R.color.base_gray_very_dark));
        holder.textViewTeamVisitorName.setTextColor(getActivity().getResources().getColor(R.color.base_gray_very_dark));
        holder.textViewTeamVisitorResult.setTextColor(getActivity().getResources().getColor(R.color.base_gray_very_dark));
        changeBackgroundColor(row, position, match);
        return row;
    }

    private void changeBackgroundColor(View row, int position, Match match) {
        if (getActivity().getGame().getUserTeam().getName().equals(match.getTeamLocal().getName()) || getActivity().getGame().getUserTeam().getName().equals(match.getTeamVisitor().getName())) {
            if (match.getMatchday().intValue() == getActivity().getGame().getCurrentMatchday().intValue()) {
                row.setBackgroundResource(R.color.holo_orange_light);
                return;
            }
            if (match.getFinalResultLocal().intValue() != 0 && match.getFinalResultVisitor().intValue() != 0) {
                if (match.getFinalResultLocal().intValue() > match.getFinalResultVisitor().intValue() && match.getTeamLocal().getId().intValue() == getActivity().getGame().getUserTeam().getId().intValue()) {
                    row.setBackgroundResource(R.color.holo_green_light);
                    return;
                } else if (match.getFinalResultLocal().intValue() < match.getFinalResultVisitor().intValue() && match.getTeamVisitor().getId().intValue() == getActivity().getGame().getUserTeam().getId().intValue()) {
                    row.setBackgroundResource(R.color.holo_green_light);
                    return;
                } else {
                    row.setBackgroundResource(R.color.holo_red_light);
                    return;
                }
            }
            row.setBackgroundResource(R.color.holo_blue_light);
            return;
        }
        if (position % 2 == 0) {
            row.setBackgroundResource(R.color.adapter_even);
        } else {
            row.setBackgroundResource(R.color.adapter_odd);
        }
    }

    private BaseActivity getActivity() {
        return (BaseActivity) this.context;
    }

    static class MatchHolder {
        public TextView textViewSeparator;
        public TextView textViewTeamLocalName;
        public TextView textViewTeamLocalResult;
        public TextView textViewTeamVisitorName;
        public TextView textViewTeamVisitorResult;

        MatchHolder() {
        }
    }
}
