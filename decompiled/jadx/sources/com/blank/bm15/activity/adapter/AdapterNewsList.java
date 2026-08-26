package com.blank.bm15.activity.adapter;

import android.app.Activity;
import android.content.Context;
import android.support.v4.view.MotionEventCompat;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;
import com.blank.bm15.activity.HomeActivity;
import com.blank.bm15.model.object.crud.News;
import com.blank.bm15pro.R;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class AdapterNewsList extends ArrayAdapter<News> {
    private Context context;
    private int layoutId;
    private List<News> newsList;

    public AdapterNewsList(Context context, int layoutId, List<News> newsList) {
        super(context, layoutId, newsList);
        this.newsList = null;
        this.context = context;
        this.layoutId = layoutId;
        this.newsList = newsList;
    }

    @Override // android.widget.ArrayAdapter, android.widget.Adapter
    public News getItem(int position) {
        return this.newsList.get(position);
    }

    @Override // android.widget.ArrayAdapter, android.widget.Adapter
    public View getView(int position, View convertView, ViewGroup parent) {
        NewsHolder holder;
        View row = convertView;
        if (row == null) {
            LayoutInflater inflater = ((Activity) this.context).getLayoutInflater();
            row = inflater.inflate(this.layoutId, parent, false);
            holder = new NewsHolder();
            holder.textViewTitle = (TextView) row.findViewById(R.id.spinnerNewsTextViewTitle);
            holder.textViewBody = (TextView) row.findViewById(R.id.spinnerNewsTextViewBody);
            holder.textViewMatchDay = (TextView) row.findViewById(R.id.spinnerNewsTextViewMatchDay);
            holder.image = (ImageView) row.findViewById(R.id.spinnerNewsImageButton);
            row.setTag(holder);
        } else {
            holder = (NewsHolder) row.getTag();
        }
        News news = this.newsList.get(position);
        holder.textViewTitle.setText(news.getTitle());
        holder.textViewBody.setText(news.getBody());
        holder.textViewMatchDay.setText(String.valueOf(this.context.getString(R.string.current_matchday)) + ": " + news.getMatchday());
        holder.image.setImageDrawable(this.context.getResources().getDrawable(news.getType().intValue()));
        HomeActivity activity = (HomeActivity) this.context;
        if (news.getMatchday().intValue() == activity.getGame().getCurrentMatchday().intValue() - 1) {
            holder.textViewTitle.setTextColor(this.context.getResources().getColor(R.color.base_gray_very_dark));
            holder.textViewBody.setTextColor(this.context.getResources().getColor(R.color.base_gray_very_dark));
            holder.textViewMatchDay.setTextColor(this.context.getResources().getColor(R.color.base_gray_very_dark));
            holder.image.setImageAlpha(MotionEventCompat.ACTION_MASK);
        } else {
            holder.textViewTitle.setTextColor(this.context.getResources().getColor(R.color.base_gray_dark));
            holder.textViewBody.setTextColor(this.context.getResources().getColor(R.color.base_gray_dark));
            holder.textViewMatchDay.setTextColor(this.context.getResources().getColor(R.color.base_gray_dark));
            holder.image.setImageAlpha(160);
        }
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

    static class NewsHolder {
        public ImageView image;
        public TextView textViewBody;
        public TextView textViewMatchDay;
        public TextView textViewTitle;

        NewsHolder() {
        }
    }
}
