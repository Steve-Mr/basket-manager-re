package com.blank.bm15.activity.adapter;

import android.app.Activity;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;
import com.blank.bm15.activity.HomeActivity;
import com.blank.bm15.dao.utils.BlankObj;
import com.blank.bm15.model.object.crud.Team;
import com.blank.bm15.model.util.Util;
import com.blank.bm15pro.R;
import java.util.List;

/* loaded from: classes.dex */
public class AdapterSelectTeamList extends ArrayAdapter<Team> {
    private Context context;
    private int layoutId;
    private List<Team> teamList;

    public AdapterSelectTeamList(Context context, int layoutId, List<Team> teamList) {
        super(context, layoutId, teamList);
        this.teamList = null;
        this.context = context;
        this.layoutId = layoutId;
        this.teamList = teamList;
    }

    @Override // android.widget.ArrayAdapter, android.widget.Adapter
    public Team getItem(int position) {
        return this.teamList.get(position);
    }

    @Override // android.widget.ArrayAdapter, android.widget.Adapter
    public View getView(int position, View convertView, ViewGroup parent) {
        TeamHolder holder;
        View row = convertView;
        Activity activity = (Activity) this.context;
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
        Team team = this.teamList.get(position);
        holder.textViewName.setText(team.getFullName());
        holder.textViewSalaryCap.setText(String.valueOf(this.context.getString(R.string.spinner_team_cap)) + ": " + Util.formatSalary(team.getSalaryCap()));
        holder.imageViewAveragePotential.setVisibility(0);
        holder.textViewClassification.setVisibility(8);
        holder.textViewSalaryCap.setVisibility(0);
        int potential = BlankObj.toInteger(team.getTeamAveragePotential()).intValue();
        if (potential >= 9) {
            holder.imageViewAveragePotential.setImageDrawable(this.context.getResources().getDrawable(R.drawable.star6));
        } else if (potential >= 7) {
            holder.imageViewAveragePotential.setImageDrawable(this.context.getResources().getDrawable(R.drawable.star5));
        } else if (potential >= 5) {
            holder.imageViewAveragePotential.setImageDrawable(this.context.getResources().getDrawable(R.drawable.star4));
        } else if (potential >= 3) {
            holder.imageViewAveragePotential.setImageDrawable(this.context.getResources().getDrawable(R.drawable.star3));
        } else if (potential >= 1) {
            holder.imageViewAveragePotential.setImageDrawable(this.context.getResources().getDrawable(R.drawable.star2));
        } else {
            holder.imageViewAveragePotential.setImageDrawable(this.context.getResources().getDrawable(R.drawable.star1));
        }
        holder.textViewMatchesWonText.setText(this.context.getString(R.string.spinner_team_average_age));
        holder.textViewMatchesLostText.setText(this.context.getString(R.string.spinner_team_average_attack));
        holder.textViewPointsScoredText.setText(this.context.getString(R.string.spinner_team_average_defense));
        holder.textViewPointsAllowedText.setText(this.context.getString(R.string.spinner_team_average_all));
        holder.textViewMatchesWon.setText(BlankObj.toInteger(team.getTeamAverageAge()).toString());
        holder.textViewMatchesLost.setText(BlankObj.toInteger(team.getTeamAverageSkillAttack()).toString());
        holder.textViewPointsScored.setText(BlankObj.toInteger(team.getTeamAverageSkillDefense()).toString());
        holder.textViewPointsAllowed.setText(BlankObj.toInteger(team.getTeamAverageSkillAll()).toString());
        holder.textViewPointsAllowedText.setTextColor(this.context.getResources().getColor(R.color.base_black));
        holder.textViewPointsAllowed.setTextColor(this.context.getResources().getColor(R.color.base_black));
        changeBackgroundColor(row, position);
        if ((this.context instanceof HomeActivity) && ((HomeActivity) this.context).getGame().getUserTeam().getId().intValue() == team.getId().intValue()) {
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
