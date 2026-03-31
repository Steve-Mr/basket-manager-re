package com.blank.bm15.activity.adapter;

import android.app.Activity;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;
import com.blank.bm15.dao.utils.BlankObj;
import com.blank.bm15.model.object.crud.MatchResult;
import com.blank.bm15.model.util.Util;
import com.blank.bm15pro.R;
import java.util.List;

/* loaded from: classes.dex */
public class AdapterMatchResultList extends ArrayAdapter<MatchResult> {
    private Context context;
    private int layoutId;
    private List<MatchResult> matchResultList;
    private Boolean showMatches;

    public AdapterMatchResultList(Context context, int layoutId, List<MatchResult> matchResultList, Boolean showMatches) {
        super(context, layoutId, matchResultList);
        this.matchResultList = null;
        this.context = context;
        this.layoutId = layoutId;
        this.matchResultList = matchResultList;
        this.showMatches = showMatches;
    }

    @Override // android.widget.ArrayAdapter, android.widget.Adapter
    public MatchResult getItem(int position) {
        return this.matchResultList.get(position);
    }

    @Override // android.widget.ArrayAdapter, android.widget.Adapter
    public View getView(int position, View convertView, ViewGroup parent) {
        MatchResultHolder holder;
        View row = convertView;
        if (row == null) {
            LayoutInflater inflater = ((Activity) this.context).getLayoutInflater();
            row = inflater.inflate(this.layoutId, parent, false);
            holder = new MatchResultHolder();
            holder.textViewPlayerName = (TextView) row.findViewById(R.id.spinnerMatchResultTextViewPlayerName);
            holder.textViewMatches = (TextView) row.findViewById(R.id.spinnerMatchResultTextViewMatches);
            holder.textViewMinutes = (TextView) row.findViewById(R.id.spinnerMatchResultTextViewMinutes);
            holder.textViewPoints = (TextView) row.findViewById(R.id.spinnerMatchResultTextViewPoints);
            holder.textViewRebounds = (TextView) row.findViewById(R.id.spinnerMatchResultTextViewRebounds);
            holder.textViewPassOK = (TextView) row.findViewById(R.id.spinnerMatchResultTextViewPassOK);
            holder.textViewBlocks = (TextView) row.findViewById(R.id.spinnerMatchResultTextViewBlocks);
            holder.textViewSteals = (TextView) row.findViewById(R.id.spinnerMatchResultTextViewSteals);
            holder.textViewPer = (TextView) row.findViewById(R.id.spinnerMatchResultTextViewPer);
            row.setTag(holder);
        } else {
            holder = (MatchResultHolder) row.getTag();
        }
        MatchResult matchResult = this.matchResultList.get(position);
        if (!this.showMatches.booleanValue()) {
            holder.textViewMatches.setVisibility(8);
        }
        if (position > 0) {
            if (matchResult.getName() == null) {
                holder.textViewPlayerName.setText(this.context.getResources().getString(R.string.spinner_match_result_total_team));
                row.setBackgroundResource(R.color.holo_green_light);
            } else {
                holder.textViewPlayerName.setText(matchResult.getName());
                changeBackgroundColor(row, position);
            }
            if (matchResult.getMatches().intValue() > 0) {
                if (matchResult.getName() == null) {
                    holder.textViewMinutes.setText("-");
                } else {
                    holder.textViewMinutes.setText(BlankObj.toString(Double.valueOf(Util.round(matchResult.getMinutesPlayed().intValue() / matchResult.getMatches().intValue(), 1))));
                }
                holder.textViewMatches.setText(BlankObj.toString(matchResult.getMatches()));
                if (matchResult.getMatches().intValue() == 1) {
                    holder.textViewPoints.setText(matchResult.getPoints().toString());
                    holder.textViewRebounds.setText(matchResult.getReboundsInt().toString());
                    holder.textViewPassOK.setText(matchResult.getPassesOkInt().toString());
                    holder.textViewBlocks.setText(matchResult.getBlocksInt().toString());
                    holder.textViewSteals.setText(matchResult.getStealsInt().toString());
                } else {
                    holder.textViewPoints.setText(BlankObj.toString(Double.valueOf(Util.round(matchResult.getPoints().intValue() / matchResult.getMatches().intValue(), 1))));
                    holder.textViewRebounds.setText(BlankObj.toString(Double.valueOf(Util.round(matchResult.getReboundsInt().intValue() / matchResult.getMatches().intValue(), 1))));
                    holder.textViewPassOK.setText(BlankObj.toString(Double.valueOf(Util.round(matchResult.getPassesOkInt().intValue() / matchResult.getMatches().intValue(), 1))));
                    holder.textViewBlocks.setText(BlankObj.toString(Double.valueOf(Util.round(matchResult.getBlocksInt().intValue() / matchResult.getMatches().intValue(), 1))));
                    holder.textViewSteals.setText(BlankObj.toString(Double.valueOf(Util.round(matchResult.getStealsInt().intValue() / matchResult.getMatches().intValue(), 1))));
                }
                holder.textViewPer.setText(BlankObj.toString(Double.valueOf(Util.round(matchResult.getPer().doubleValue(), 2))));
            } else {
                holder.textViewMatches.setText("-");
                holder.textViewMinutes.setText("-");
                holder.textViewPoints.setText("-");
                holder.textViewRebounds.setText("-");
                holder.textViewPassOK.setText("-");
                holder.textViewBlocks.setText("-");
                holder.textViewSteals.setText("-");
                holder.textViewPer.setText("-");
            }
        } else {
            holder.textViewPlayerName.setText(this.context.getString(R.string.name));
            holder.textViewMatches.setText(this.context.getString(R.string.spinner_match_result_matches));
            holder.textViewMinutes.setText(this.context.getString(R.string.spinner_match_result_minutes));
            holder.textViewPoints.setText(this.context.getString(R.string.spinner_match_result_points));
            holder.textViewRebounds.setText(this.context.getString(R.string.spinner_match_result_rebound));
            holder.textViewPassOK.setText(this.context.getString(R.string.spinner_match_result_pass));
            holder.textViewBlocks.setText(this.context.getString(R.string.spinner_match_result_block));
            holder.textViewSteals.setText(this.context.getString(R.string.spinner_match_result_steal));
            holder.textViewPer.setText(this.context.getString(R.string.spinner_match_result_per));
            row.setBackgroundResource(R.color.holo_blue_light);
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
    static class MatchResultHolder {
        public TextView textViewBlocks;
        public TextView textViewMatches;
        public TextView textViewMinutes;
        public TextView textViewPassOK;
        public TextView textViewPer;
        public TextView textViewPlayerName;
        public TextView textViewPoints;
        public TextView textViewRebounds;
        public TextView textViewSteals;

        MatchResultHolder() {
        }
    }
}
