package com.blank.bm15.activity.adapter;

import android.app.Activity;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;
import com.blank.bm15.model.object.crud.Game;
import com.blank.bm15.model.util.Util;
import com.blank.bm15pro.R;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class AdapterGameList extends ArrayAdapter<Game> {
    private Context context;
    private List<Game> gameList;
    private int layoutId;

    public AdapterGameList(Context context, int layoutId, List<Game> gameList) {
        super(context, layoutId, gameList);
        this.gameList = null;
        this.context = context;
        this.layoutId = layoutId;
        this.gameList = gameList;
    }

    @Override // android.widget.ArrayAdapter, android.widget.Adapter
    public Game getItem(int position) {
        return this.gameList.get(position);
    }

    @Override // android.widget.ArrayAdapter, android.widget.Adapter
    public View getView(int position, View convertView, ViewGroup parent) {
        GameHolder holder;
        View row = convertView;
        if (row == null) {
            LayoutInflater inflater = ((Activity) this.context).getLayoutInflater();
            row = inflater.inflate(this.layoutId, parent, false);
            holder = new GameHolder();
            holder.viewTeamColor = row.findViewById(R.id.spinnerGameViewTeamColor);
            holder.textViewName = (TextView) row.findViewById(R.id.spinnerGameTextViewName);
            holder.textViewTeam = (TextView) row.findViewById(R.id.spinnerGameTextViewTeam);
            holder.textViewCurrentSeason = (TextView) row.findViewById(R.id.spinnerGameTextViewCurrentSeason);
            holder.textViewCurrentMatchday = (TextView) row.findViewById(R.id.spinnerGameTextViewCurrentMatchday);
            row.setTag(holder);
        } else {
            holder = (GameHolder) row.getTag();
        }
        Game game = this.gameList.get(position);
        String conference = Util.getConference((Activity) this.context, game.getUserTeam().getConference());
        String division = Util.getDivision((Activity) this.context, game.getUserTeam().getDivision());
        holder.textViewName.setText(game.getName());
        if (game.getUserTeam().getName() != null) {
            holder.textViewTeam.setText(String.valueOf(game.getUserTeam().getFullName()) + " (" + conference + " / " + division + ")");
        } else {
            holder.textViewTeam.setText("");
        }
        holder.textViewCurrentSeason.setText(String.valueOf(this.context.getResources().getString(R.string.current_season)) + ": " + game.getCurrentSeason());
        holder.textViewCurrentMatchday.setText(String.valueOf(this.context.getResources().getString(R.string.current_matchday)) + ": " + game.getCurrentMatchday());
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

    static class GameHolder {
        public TextView textViewCurrentMatchday;
        public TextView textViewCurrentSeason;
        public TextView textViewName;
        public TextView textViewTeam;
        public View viewTeamColor;

        GameHolder() {
        }
    }
}
