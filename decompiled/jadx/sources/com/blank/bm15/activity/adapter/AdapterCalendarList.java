package com.blank.bm15.activity.adapter;

import android.app.Activity;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;
import com.blank.bm15.activity.base.BaseActivity;
import com.blank.bm15.dao.utils.BlankObj;
import com.blank.bm15.model.object.crud.Match;
import com.blank.bm15pro.R;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class AdapterCalendarList extends ArrayAdapter<Match> {
    private Context context;
    private int layoutId;
    private List<Match> matchList;

    public AdapterCalendarList(Context context, int layoutId, List<Match> matchList) {
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
            holder.imageView = (ImageView) row.findViewById(R.id.spinnerCalendarImageView);
            holder.textViewName = (TextView) row.findViewById(R.id.spinnerCalendarTextViewName);
            holder.textViewMatchday = (TextView) row.findViewById(R.id.spinnerCalendarTextViewMatchday);
            row.setTag(holder);
        } else {
            holder = (MatchHolder) row.getTag();
        }
        if (position % 2 == 0) {
            row.setBackgroundResource(R.color.adapter_even);
        } else {
            row.setBackgroundResource(R.color.adapter_odd);
        }
        Match match = this.matchList.get(position);
        holder.imageView.setVisibility(4);
        holder.textViewName.setVisibility(4);
        holder.textViewMatchday.setText(BlankObj.toString(match.getMatchday()));
        holder.textViewMatchday.setVisibility(0);
        if (match.getMatchday().intValue() == 88) {
            holder.textViewName.setVisibility(0);
            holder.textViewName.setText(this.context.getString(R.string.calendar_game_market_closed));
            holder.textViewMatchday.setVisibility(4);
            row.setBackgroundResource(R.color.holo_purple);
        } else if (match.getMatchday().intValue() == 167) {
            holder.textViewName.setVisibility(0);
            holder.textViewName.setText(this.context.getString(R.string.playoffs_quarters));
            holder.textViewMatchday.setVisibility(4);
            row.setBackgroundResource(R.color.holo_purple);
        } else if (match.getMatchday().intValue() == 182) {
            holder.textViewName.setVisibility(0);
            holder.textViewName.setText(this.context.getString(R.string.playoffs_semifinals));
            holder.textViewMatchday.setVisibility(4);
            row.setBackgroundResource(R.color.holo_purple);
        } else if (match.getMatchday().intValue() == 197) {
            holder.textViewName.setVisibility(0);
            holder.textViewName.setText(this.context.getString(R.string.playoffs_conference));
            holder.textViewMatchday.setVisibility(4);
            row.setBackgroundResource(R.color.holo_purple);
        } else if (match.getMatchday().intValue() == 212) {
            holder.textViewName.setVisibility(0);
            holder.textViewName.setText(this.context.getString(R.string.playoffs_world));
            holder.textViewMatchday.setVisibility(4);
            row.setBackgroundResource(R.color.holo_purple);
        } else if (match.getMatchday().intValue() == 226) {
            holder.textViewName.setVisibility(0);
            holder.textViewName.setText(this.context.getString(R.string.calendar_game_season_finish));
            holder.textViewMatchday.setVisibility(4);
            row.setBackgroundResource(R.color.holo_purple);
        }
        if (match.getMatchday().intValue() == getActivity().getGame().getCurrentMatchday().intValue()) {
            row.setBackgroundResource(R.color.holo_orange_light);
        }
        if (match.getTeamLocal().getId() != null && match.getTeamVisitor().getId() != null) {
            if (match.getTeamLocal().getId().intValue() == getActivity().getGame().getUserTeam().getId().intValue()) {
                holder.imageView.setVisibility(0);
                holder.imageView.setImageDrawable(getActivity().getResources().getDrawable(R.drawable.calendar_home));
                holder.textViewName.setVisibility(0);
                holder.textViewName.setText(match.getTeamVisitor().getShortFullName());
            } else if (match.getTeamVisitor().getId().intValue() == getActivity().getGame().getUserTeam().getId().intValue()) {
                holder.imageView.setVisibility(0);
                holder.imageView.setImageDrawable(getActivity().getResources().getDrawable(R.drawable.calendar_away));
                holder.textViewName.setVisibility(0);
                holder.textViewName.setText(match.getTeamLocal().getShortFullName());
            }
            if (match.getFinalResultLocal().intValue() != 0 && match.getFinalResultVisitor().intValue() != 0) {
                if (match.getFinalResultLocal().intValue() > match.getFinalResultVisitor().intValue() && match.getTeamLocal().getId().intValue() == getActivity().getGame().getUserTeam().getId().intValue()) {
                    row.setBackgroundResource(R.color.holo_green_light);
                } else if (match.getFinalResultLocal().intValue() < match.getFinalResultVisitor().intValue() && match.getTeamVisitor().getId().intValue() == getActivity().getGame().getUserTeam().getId().intValue()) {
                    row.setBackgroundResource(R.color.holo_green_light);
                } else {
                    row.setBackgroundResource(R.color.holo_red_light);
                }
            } else if (match.getMatchday().intValue() != getActivity().getGame().getCurrentMatchday().intValue()) {
                row.setBackgroundResource(R.color.holo_blue_light);
            }
        }
        return row;
    }

    private BaseActivity getActivity() {
        return (BaseActivity) this.context;
    }

    static class MatchHolder {
        public ImageView imageView;
        public TextView textViewMatchday;
        public TextView textViewName;

        MatchHolder() {
        }
    }
}
