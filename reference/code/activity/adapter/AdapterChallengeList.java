package com.blank.bm15.activity.adapter;

import android.app.Activity;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;
import com.blank.bm15.model.object.crud.Challenge;
import com.blank.bm15pro.R;
import java.util.List;

/* loaded from: classes.dex */
public class AdapterChallengeList extends ArrayAdapter<Challenge> {
    private List<Challenge> challengeList;
    private Context context;
    private int layoutId;

    public AdapterChallengeList(Context context, int layoutId, List<Challenge> challengeList) {
        super(context, layoutId, challengeList);
        this.challengeList = null;
        this.context = context;
        this.layoutId = layoutId;
        this.challengeList = challengeList;
    }

    @Override // android.widget.ArrayAdapter, android.widget.Adapter
    public Challenge getItem(int position) {
        return this.challengeList.get(position);
    }

    @Override // android.widget.ArrayAdapter, android.widget.Adapter
    public View getView(int position, View convertView, ViewGroup parent) {
        ChallengeHolder holder;
        View row = convertView;
        if (row == null) {
            LayoutInflater inflater = ((Activity) this.context).getLayoutInflater();
            row = inflater.inflate(this.layoutId, parent, false);
            holder = new ChallengeHolder();
            holder.imageViewIcon = (ImageView) row.findViewById(R.id.spinnerDrawerItemImageViewIcon);
            holder.textViewTitle = (TextView) row.findViewById(R.id.spinnerDrawerItemTextViewTitle);
            holder.textViewText = (TextView) row.findViewById(R.id.spinnerDrawerItemTextViewText);
            row.setTag(holder);
        } else {
            holder = (ChallengeHolder) row.getTag();
        }
        Challenge obj = this.challengeList.get(position);
        if (obj.getAcquired().booleanValue()) {
            holder.imageViewIcon.setImageDrawable(this.context.getResources().getDrawable(R.drawable.star6));
            holder.textViewText.setText(String.format(this.context.getString(R.string.challenges_adquireds), obj.getSeason()));
            holder.textViewTitle.setTextColor(R.color.base_gray_very_dark);
            holder.textViewText.setTextColor(R.color.base_gray_very_dark);
        } else {
            holder.imageViewIcon.setImageDrawable(this.context.getResources().getDrawable(R.drawable.star1));
            holder.textViewText.setText("");
            holder.textViewTitle.setTextColor(R.color.base_gray_very_light);
            holder.textViewText.setTextColor(R.color.base_gray_very_light);
        }
        holder.textViewTitle.setText(obj.getTeamName());
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

    /* loaded from: classes.dex */
    static class ChallengeHolder {
        public ImageView imageViewIcon;
        public TextView textViewText;
        public TextView textViewTitle;

        ChallengeHolder() {
        }
    }
}
