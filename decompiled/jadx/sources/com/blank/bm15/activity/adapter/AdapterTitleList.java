package com.blank.bm15.activity.adapter;

import android.app.Activity;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;
import com.blank.bm15pro.R;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class AdapterTitleList extends ArrayAdapter<String> {
    private Context context;
    private boolean isDark;
    private int layoutId;
    private List<String> titleList;

    public AdapterTitleList(Context context, Boolean isDark) {
        super(context, R.layout.layout_title);
        this.titleList = null;
        this.context = context;
        this.layoutId = R.layout.layout_title;
        this.isDark = isDark.booleanValue();
        this.titleList = new ArrayList();
    }

    @Override // android.widget.ArrayAdapter, android.widget.Adapter
    public String getItem(int position) {
        return this.titleList.get(position);
    }

    @Override // android.widget.ArrayAdapter
    public void add(String object) {
        super.add(object);
        this.titleList.add(object);
    }

    @Override // android.widget.ArrayAdapter, android.widget.Adapter
    public View getView(int position, View convertView, ViewGroup parent) {
        TitleHolder holder;
        View row = convertView;
        if (row == null) {
            LayoutInflater inflater = ((Activity) this.context).getLayoutInflater();
            row = inflater.inflate(this.layoutId, parent, false);
            holder = new TitleHolder();
            holder.textViewTitle = (TextView) row.findViewById(R.id.layoutTextViewTitle);
            holder.viewLine = row.findViewById(R.id.layoutViewLine);
            row.setTag(holder);
        } else {
            holder = (TitleHolder) row.getTag();
        }
        String title = this.titleList.get(position);
        holder.textViewTitle.setText(title);
        if (this.isDark) {
            holder.textViewTitle.setTextColor(this.context.getResources().getColor(R.color.holo_blue_light));
            holder.viewLine.setBackgroundColor(this.context.getResources().getColor(R.color.holo_blue_light));
        }
        return row;
    }

    static class TitleHolder {
        public TextView textViewTitle;
        public View viewLine;

        TitleHolder() {
        }
    }
}
