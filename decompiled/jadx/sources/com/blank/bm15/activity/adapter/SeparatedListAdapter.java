package com.blank.bm15.activity.adapter;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Adapter;
import android.widget.ArrayAdapter;
import android.widget.BaseAdapter;
import java.util.LinkedHashMap;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
public class SeparatedListAdapter extends BaseAdapter {
    public static final int TYPE_SECTION_HEADER = 0;
    public final ArrayAdapter<String> headers;
    public final Map<String, Adapter> sections;

    public SeparatedListAdapter(Context context) {
        this(context, Boolean.FALSE);
    }

    public SeparatedListAdapter(Context context, Boolean isDark) {
        this.sections = new LinkedHashMap();
        this.headers = new AdapterTitleList(context, isDark);
    }

    public void addSection(String section, Adapter adapter) {
        this.headers.add(section);
        this.sections.put(section, adapter);
    }

    @Override // android.widget.Adapter
    public Object getItem(int position) {
        for (Object section : this.sections.keySet()) {
            Adapter adapter = this.sections.get(section);
            int size = adapter.getCount() + 1;
            if (position == 0) {
                return section;
            }
            if (position < size) {
                return adapter.getItem(position - 1);
            }
            position -= size;
        }
        return null;
    }

    @Override // android.widget.Adapter
    public int getCount() {
        int total = 0;
        for (Adapter adapter : this.sections.values()) {
            total += adapter.getCount() + 1;
        }
        return total;
    }

    @Override // android.widget.BaseAdapter, android.widget.Adapter
    public int getViewTypeCount() {
        int total = 1;
        for (Adapter adapter : this.sections.values()) {
            total += adapter.getViewTypeCount();
        }
        return total;
    }

    @Override // android.widget.BaseAdapter, android.widget.Adapter
    public int getItemViewType(int position) {
        int type = 1;
        for (Object section : this.sections.keySet()) {
            Adapter adapter = this.sections.get(section);
            int size = adapter.getCount() + 1;
            if (position == 0) {
                return 0;
            }
            if (position < size) {
                return adapter.getItemViewType(position - 1) + type;
            }
            position -= size;
            type += adapter.getViewTypeCount();
        }
        return -1;
    }

    public boolean areAllItemsSelectable() {
        return false;
    }

    @Override // android.widget.BaseAdapter, android.widget.ListAdapter
    public boolean isEnabled(int position) {
        return getItemViewType(position) != 0;
    }

    @Override // android.widget.Adapter
    public View getView(int position, View convertView, ViewGroup parent) {
        int sectionnum = 0;
        for (Object section : this.sections.keySet()) {
            Adapter adapter = this.sections.get(section);
            int size = adapter.getCount() + 1;
            if (position == 0) {
                return this.headers.getView(sectionnum, convertView, parent);
            }
            if (position < size) {
                return adapter.getView(position - 1, convertView, parent);
            }
            position -= size;
            sectionnum++;
        }
        return null;
    }

    @Override // android.widget.Adapter
    public long getItemId(int position) {
        return position;
    }
}
