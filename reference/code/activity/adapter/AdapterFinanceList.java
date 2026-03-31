package com.blank.bm15.activity.adapter;

import android.app.Activity;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;
import com.blank.bm15.model.object.other.Finance;
import com.blank.bm15.model.util.Util;
import com.blank.bm15pro.R;
import java.util.List;

/* loaded from: classes.dex */
public class AdapterFinanceList extends ArrayAdapter<Finance> {
    private Context context;
    private List<Finance> financeList;
    private int layoutId;

    public AdapterFinanceList(Context context, int layoutId, List<Finance> financeList) {
        super(context, layoutId, financeList);
        this.financeList = null;
        this.context = context;
        this.layoutId = layoutId;
        this.financeList = financeList;
    }

    @Override // android.widget.ArrayAdapter, android.widget.Adapter
    public Finance getItem(int position) {
        return this.financeList.get(position);
    }

    @Override // android.widget.ArrayAdapter, android.widget.Adapter
    public View getView(int position, View convertView, ViewGroup parent) {
        FinanceHolder holder;
        View row = convertView;
        if (row == null) {
            LayoutInflater inflater = ((Activity) this.context).getLayoutInflater();
            row = inflater.inflate(this.layoutId, parent, false);
            holder = new FinanceHolder();
            holder.textViewPlayerName = (TextView) row.findViewById(R.id.spinnerFinanceTextViewPlayerName);
            holder.textViewYear1 = (TextView) row.findViewById(R.id.spinnerFinanceTextViewYear1);
            holder.textViewYear2 = (TextView) row.findViewById(R.id.spinnerFinanceTextViewYear2);
            holder.textViewYear3 = (TextView) row.findViewById(R.id.spinnerFinanceTextViewYear3);
            holder.textViewYear4 = (TextView) row.findViewById(R.id.spinnerFinanceTextViewYear4);
            holder.textViewYear5 = (TextView) row.findViewById(R.id.spinnerFinanceTextViewYear5);
            row.setTag(holder);
        } else {
            holder = (FinanceHolder) row.getTag();
        }
        Finance finance = this.financeList.get(position);
        if (position > 0) {
            holder.textViewYear1.setText(Util.formatSalary(finance.getYear1()));
            holder.textViewYear2.setText(Util.formatSalary(finance.getYear2()));
            holder.textViewYear3.setText(Util.formatSalary(finance.getYear3()));
            holder.textViewYear4.setText(Util.formatSalary(finance.getYear4()));
            holder.textViewYear5.setText(Util.formatSalary(finance.getYear5()));
            changeBackgroundColor(row, position);
            if (position == this.financeList.size() - 1) {
                holder.textViewPlayerName.setText(this.context.getString(R.string.spinner_finance_total));
                row.setBackgroundResource(R.color.holo_green_light);
            } else {
                holder.textViewPlayerName.setText(finance.getPlayer().getShortName());
            }
        } else {
            holder.textViewPlayerName.setText(this.context.getString(R.string.name));
            holder.textViewYear1.setText(this.context.getString(R.string.spinner_finance_year1));
            holder.textViewYear2.setText(this.context.getString(R.string.spinner_finance_year2));
            holder.textViewYear3.setText(this.context.getString(R.string.spinner_finance_year3));
            holder.textViewYear4.setText(this.context.getString(R.string.spinner_finance_year4));
            holder.textViewYear5.setText(this.context.getString(R.string.spinner_finance_year5));
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
    static class FinanceHolder {
        public TextView textViewPlayerName;
        public TextView textViewYear1;
        public TextView textViewYear2;
        public TextView textViewYear3;
        public TextView textViewYear4;
        public TextView textViewYear5;

        FinanceHolder() {
        }
    }
}
