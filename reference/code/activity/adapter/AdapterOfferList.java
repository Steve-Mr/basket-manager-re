package com.blank.bm15.activity.adapter;

import android.app.Activity;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;
import com.blank.bm15.activity.base.BaseActivity;
import com.blank.bm15.dao.utils.BlankObj;
import com.blank.bm15.model.object.crud.Offer;
import com.blank.bm15.model.util.Util;
import com.blank.bm15pro.R;
import java.util.List;

/* loaded from: classes.dex */
public class AdapterOfferList extends ArrayAdapter<Offer> {
    private Context context;
    private int layoutId;
    private List<Offer> offerList;

    public AdapterOfferList(Context context, int layoutId, List<Offer> offerList) {
        super(context, layoutId, offerList);
        this.offerList = null;
        this.context = context;
        this.layoutId = layoutId;
        this.offerList = offerList;
    }

    @Override // android.widget.ArrayAdapter, android.widget.Adapter
    public Offer getItem(int position) {
        return this.offerList.get(position);
    }

    @Override // android.widget.ArrayAdapter, android.widget.Adapter
    public View getView(int position, View convertView, ViewGroup parent) {
        OfferHolder holder;
        View row = convertView;
        if (row == null) {
            LayoutInflater inflater = ((Activity) this.context).getLayoutInflater();
            row = inflater.inflate(this.layoutId, parent, false);
            holder = new OfferHolder();
            holder.textViewSalary = (TextView) row.findViewById(R.id.spinnerOfferTextViewSalary);
            holder.textViewYearsContract = (TextView) row.findViewById(R.id.spinnerOfferTextViewYearsContract);
            row.setTag(holder);
        } else {
            holder = (OfferHolder) row.getTag();
        }
        Offer offer = this.offerList.get(position);
        holder.textViewSalary.setText(String.valueOf(this.context.getString(R.string.free_agent_salary)) + ": " + Util.formatSalary(offer.getSalary()));
        holder.textViewYearsContract.setText(String.valueOf(BlankObj.toString(offer.getYears())) + " " + this.context.getString(R.string.free_agent_years_contract) + ".");
        int teamSalary = getActivity().getGame().getUserTeam().getTeamSalary(offer.getPlayer()).intValue();
        if (offer.getSalary().intValue() + teamSalary > getActivity().getGame().getUserTeam().getSalaryCap().intValue() && offer.getSalary().intValue() > 1000000) {
            holder.textViewSalary.setTextColor(this.context.getResources().getColor(R.color.holo_red_dark));
            holder.textViewYearsContract.setTextColor(this.context.getResources().getColor(R.color.holo_red_dark));
        } else {
            holder.textViewSalary.setTextColor(this.context.getResources().getColor(R.color.base_gray_very_dark));
            holder.textViewYearsContract.setTextColor(this.context.getResources().getColor(R.color.base_gray_very_dark));
        }
        changeBackgroundColor(row, position);
        return row;
    }

    private BaseActivity getActivity() {
        return (BaseActivity) this.context;
    }

    private void changeBackgroundColor(View row, int position) {
        if (position % 2 == 0) {
            row.setBackgroundResource(R.color.adapter_even);
        } else {
            row.setBackgroundResource(R.color.adapter_odd);
        }
    }

    /* loaded from: classes.dex */
    static class OfferHolder {
        public TextView textViewSalary;
        public TextView textViewYearsContract;

        OfferHolder() {
        }
    }
}
