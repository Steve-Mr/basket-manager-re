package com.blank.bm15.activity.adapter;

import android.app.Activity;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;
import com.blank.bm15.model.object.crud.DraftRound;
import com.blank.bm15pro.R;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class AdapterDraftRoundList extends ArrayAdapter<DraftRound> {
    private Context context;
    private int layoutId;
    private List<DraftRound> list;

    public AdapterDraftRoundList(Context context, int layoutId, List<DraftRound> list) {
        super(context, layoutId, list);
        this.list = null;
        this.context = context;
        this.layoutId = layoutId;
        this.list = list;
    }

    @Override // android.widget.ArrayAdapter, android.widget.Adapter
    public DraftRound getItem(int position) {
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
            holder.textViewValue = (TextView) row.findViewById(R.id.spinnerStringTextViewValue);
            row.setTag(holder);
        } else {
            holder = (ItemHolder) row.getTag();
        }
        DraftRound obj = this.list.get(position);
        holder.textViewValue.setText(String.format(this.context.getString(R.string.trade_round_1), obj.getTeamOwner().getName()));
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

    private static class ItemHolder {
        public TextView textViewValue;

        private ItemHolder() {
        }

        /* synthetic */ ItemHolder(ItemHolder itemHolder) {
            this();
        }
    }
}
