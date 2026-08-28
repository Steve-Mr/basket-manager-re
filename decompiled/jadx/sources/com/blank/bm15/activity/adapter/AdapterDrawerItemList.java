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
import com.blank.bm15.activity.base.BaseActivity;
import com.blank.bm15.dao.utils.BlankObj;
import com.blank.bm15.model.object.crud.Navigation;
import com.blank.bm15.model.object.other.DrawerItem;
import com.blank.bm15.model.util.Util;
import com.blank.bm15pro.R;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class AdapterDrawerItemList extends ArrayAdapter<DrawerItem> {
    private Context context;
    private int layoutId;
    private List<DrawerItem> list;
    Navigation navigation;

    public AdapterDrawerItemList(Context context, int layoutId, List<DrawerItem> list) {
        super(context, layoutId, list);
        this.list = null;
        this.context = context;
        this.layoutId = layoutId;
        this.list = list;
        this.navigation = BaseActivity.getNavigation(context);
    }

    @Override // android.widget.ArrayAdapter, android.widget.Adapter
    public DrawerItem getItem(int position) {
        return this.list.get(position);
    }

    @Override // android.widget.ArrayAdapter, android.widget.Adapter
    public View getView(int position, View convertView, ViewGroup parent) {
        ItemHolder holder;
        View row = convertView;
        if (row == null) {
            LayoutInflater inflater = ((Activity) this.context).getLayoutInflater();
            row = inflater.inflate(this.layoutId, parent, false);
            holder = new ItemHolder(null);
            holder.imageViewIcon = (ImageView) row.findViewById(R.id.spinnerDrawerItemImageViewIcon);
            holder.textViewId = (TextView) row.findViewById(R.id.spinnerDrawerItemTextViewId);
            holder.textViewTitle = (TextView) row.findViewById(R.id.spinnerDrawerItemTextViewTitle);
            holder.textViewText = (TextView) row.findViewById(R.id.spinnerDrawerItemTextViewText);
            row.setTag(holder);
        } else {
            holder = (ItemHolder) row.getTag();
        }
        DrawerItem obj = this.list.get(position);
        if (obj.getIcon() != null) {
            holder.imageViewIcon.setImageDrawable(this.context.getResources().getDrawable(obj.getIcon().intValue()));
            holder.imageViewIcon.setVisibility(0);
        } else {
            holder.imageViewIcon.setVisibility(4);
        }
        holder.textViewId.setText(BlankObj.toString(obj.getId()));
        holder.textViewTitle.setText(obj.getTitle());
        if (obj.getText() != null) {
            holder.textViewText.setText(obj.getText());
        } else {
            holder.textViewText.setText("");
        }
        changeBackgroundColor(row, position, obj);
        return row;
    }

    private void changeBackgroundColor(View row, int position, DrawerItem obj) {
        HomeActivity activity = (HomeActivity) this.context;
        if (11 == this.navigation.getIdFragment().intValue() && 10 == obj.getId().intValue()) {
            row.setBackgroundResource(Util.getTeamColor(activity.getGame().getUserTeam()));
        } else if (this.navigation.getIdFragment().intValue() == obj.getId().intValue()) {
            row.setBackgroundResource(Util.getTeamColor(activity.getGame().getUserTeam()));
        }
    }

    private static class ItemHolder {
        public ImageView imageViewIcon;
        public TextView textViewId;
        public TextView textViewText;
        public TextView textViewTitle;

        private ItemHolder() {
        }

        /* synthetic */ ItemHolder(ItemHolder itemHolder) {
            this();
        }
    }
}
