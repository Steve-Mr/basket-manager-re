package com.blank.bm15.activity.adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;
import com.blank.bm15.activity.HomeActivity;
import com.blank.bm15.dao.utils.BlankObj;
import com.blank.bm15.model.object.other.Classification;
import com.blank.bm15pro.R;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class AdapterClassificationList extends ArrayAdapter<Classification> {
    private List<Classification> classificationList;
    private Context context;
    private int layoutId;

    public AdapterClassificationList(Context context, int layoutId, List<Classification> classificationList) {
        super(context, layoutId, classificationList);
        this.classificationList = null;
        this.context = context;
        this.layoutId = layoutId;
        this.classificationList = classificationList;
    }

    @Override // android.widget.ArrayAdapter, android.widget.Adapter
    public Classification getItem(int position) {
        return this.classificationList.get(position);
    }

    @Override // android.widget.ArrayAdapter, android.widget.Adapter
    public View getView(int position, View convertView, ViewGroup parent) {
        TeamHolder holder;
        View row = convertView;
        HomeActivity activity = (HomeActivity) this.context;
        if (row == null) {
            LayoutInflater inflater = activity.getLayoutInflater();
            row = inflater.inflate(this.layoutId, parent, false);
            holder = new TeamHolder();
            holder.imageViewAveragePotential = (ImageView) row.findViewById(R.id.spinnerTeamImageViewAveragePotential);
            holder.textViewClassification = (TextView) row.findViewById(R.id.spinnerTeamTextViewClassification);
            holder.textViewName = (TextView) row.findViewById(R.id.spinnerTeamTextViewName);
            holder.textViewSalaryCap = (TextView) row.findViewById(R.id.spinnerTeamTextViewSalaryCap);
            holder.textViewMatchesWonText = (TextView) row.findViewById(R.id.spinnerTeamTextViewMatchesWonText);
            holder.textViewMatchesLostText = (TextView) row.findViewById(R.id.spinnerTeamTextViewMatchesLostText);
            holder.textViewPointsScoredText = (TextView) row.findViewById(R.id.spinnerTeamTextViewPointsScoredText);
            holder.textViewPointsAllowedText = (TextView) row.findViewById(R.id.spinnerTeamTextViewPointsAllowedText);
            holder.textViewMatchesWon = (TextView) row.findViewById(R.id.spinnerTeamTextViewMatchesWon);
            holder.textViewMatchesLost = (TextView) row.findViewById(R.id.spinnerTeamTextViewMatchesLost);
            holder.textViewPointsScored = (TextView) row.findViewById(R.id.spinnerTeamTextViewPointsScored);
            holder.textViewPointsAllowed = (TextView) row.findViewById(R.id.spinnerTeamTextViewPointsAllowed);
            row.setTag(holder);
        } else {
            holder = (TeamHolder) row.getTag();
        }
        Classification classification = this.classificationList.get(position);
        holder.textViewName.setText(classification.getTeam().getFullName());
        holder.textViewClassification.setText(BlankObj.toString(classification.getPositionInConference()));
        holder.textViewMatchesWon.setText(BlankObj.toString(classification.getGamesWon()));
        holder.textViewMatchesLost.setText(BlankObj.toString(classification.getGamesLost()));
        holder.textViewPointsScored.setText(BlankObj.toString(classification.getPointsScored()));
        holder.textViewPointsAllowed.setText(BlankObj.toString(classification.getPointsAllowed()));
        if (classification.getIsClassified().booleanValue()) {
            holder.textViewClassification.setTextColor(activity.getResources().getColor(R.color.holo_red_dark));
        } else {
            holder.textViewClassification.setTextColor(activity.getResources().getColor(R.color.base_gray_dark));
        }
        changeBackgroundColor(row, position, classification, activity);
        return row;
    }

    private void changeBackgroundColor(View row, int position, Classification classification, HomeActivity activity) {
        if (activity.getGame().getUserTeam().getId() != null && activity.getGame().getUserTeam().getId().intValue() == classification.getTeam().getId().intValue()) {
            row.setBackgroundResource(R.color.holo_blue_light);
        } else if (position % 2 == 0) {
            row.setBackgroundResource(R.color.adapter_even);
        } else {
            row.setBackgroundResource(R.color.adapter_odd);
        }
    }

    static class TeamHolder {
        public ImageView imageViewAveragePotential;
        public TextView textViewClassification;
        public TextView textViewMatchesLost;
        public TextView textViewMatchesLostText;
        public TextView textViewMatchesWon;
        public TextView textViewMatchesWonText;
        public TextView textViewName;
        public TextView textViewPointsAllowed;
        public TextView textViewPointsAllowedText;
        public TextView textViewPointsScored;
        public TextView textViewPointsScoredText;
        public TextView textViewSalaryCap;

        TeamHolder() {
        }
    }
}
