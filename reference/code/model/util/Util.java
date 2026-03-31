package com.blank.bm15.model.util;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import com.blank.bm15.dao.utils.BlankObj;
import com.blank.bm15.model.object.crud.Player;
import com.blank.bm15.model.object.crud.Team;
import com.blank.bm15pro.R;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Locale;
import java.util.StringTokenizer;

/* loaded from: classes.dex */
public class Util {
    public static Boolean isNullOrEmpty(String text) {
        return text == null || "".equals(text);
    }

    public static String getPlayerShortName(String fullName) {
        if (fullName == null) {
            return "-";
        }
        StringTokenizer st = new StringTokenizer(fullName, " ");
        String name = st.nextToken();
        if (st.hasMoreTokens()) {
            String surname = st.nextToken();
            if (name.endsWith(".")) {
                String shortName = String.valueOf(name) + " " + surname;
                return shortName;
            }
            String shortName2 = String.valueOf(name.substring(0, 1)) + ". " + surname;
            return shortName2;
        }
        return name;
    }

    public static Integer getIntegerOfIntent(Activity activity, String key) {
        Bundle bundle;
        Intent intent = activity.getIntent();
        if (intent == null || (bundle = intent.getExtras()) == null) {
            return null;
        }
        Integer integer = Integer.valueOf(bundle.getInt(key));
        return integer;
    }

    public static String getStringOfIntent(Activity activity, String key) {
        Bundle bundle;
        Intent intent = activity.getIntent();
        if (intent == null || (bundle = intent.getExtras()) == null) {
            return null;
        }
        String string = bundle.getString(key);
        return string;
    }

    public static double round(double number) {
        return round(number, 2);
    }

    public static double round(double number, int decimals) {
        int aux = (int) Math.pow(10.0d, decimals);
        return Math.rint(aux * number) / aux;
    }

    public static Integer getRandomValue(Integer minValue, Integer maxValue) {
        return Integer.valueOf((int) Math.floor((Math.random() * ((maxValue.intValue() - minValue.intValue()) + 1)) + minValue.intValue()));
    }

    public static Double getRandomSimulate(Double base) {
        ArrayList<Integer> list = new ArrayList<>();
        int minValue = 15;
        int maxValue = 25;
        if (base.doubleValue() == 0.0d) {
            minValue = 10;
            maxValue = 20;
        }
        list.add(getRandomValue(minValue, maxValue));
        list.add(getRandomValue(minValue, maxValue));
        list.add(getRandomValue(minValue, maxValue));
        Collections.sort(list);
        double result = list.get(1).intValue() / 10.0d;
        return Double.valueOf(base.doubleValue() + result);
    }

    public static int getRandomPotential(int base) {
        ArrayList<Integer> list = new ArrayList<>();
        list.add(getRandomValue(1, 8));
        list.add(getRandomValue(1, 8));
        list.add(getRandomValue(1, 8));
        list.add(getRandomValue(1, 8));
        list.add(getRandomValue(1, 8));
        list.add(getRandomValue(1, 8));
        list.add(getRandomValue(1, 8));
        Collections.sort(list);
        return list.get(3).intValue() + base;
    }

    public static String getConference(Activity activity, Integer value) {
        if (value == null) {
            return "";
        }
        if (1 == value.intValue()) {
            return activity.getString(R.string.conference_east);
        }
        if (2 == value.intValue()) {
            return activity.getString(R.string.conference_west);
        }
        return null;
    }

    public static Integer getSalary(Player player) {
        int roundedSalary;
        double subAverage = player.getAverageSkillAll().doubleValue() - 40.0d;
        double value = (120.0d * (((((subAverage * subAverage) * subAverage) * subAverage) / 400.0d) * (((40 - player.getAge().intValue()) + (player.getPotential().intValue() * 2)) + 75))) / 100.0d;
        if (player.getPositionSecond().intValue() != 0) {
            value += (value * 10.0d) / 100.0d;
        }
        int roundedSalary2 = BlankObj.toInteger(Double.valueOf(value * 10.0d)).intValue();
        if (roundedSalary2 < 100000) {
            roundedSalary = 100000;
        } else {
            roundedSalary = (roundedSalary2 / 1000) * 1000;
        }
        return Integer.valueOf(roundedSalary);
    }

    public static String formatSalary(Integer salary) {
        return String.valueOf(NumberFormat.getNumberInstance(Locale.US).format(salary)) + " $";
    }

    public static String getDivision(Activity activity, Integer value) {
        if (value == null) {
            return "";
        }
        if (1 == value.intValue()) {
            return activity.getString(R.string.division_e1);
        }
        if (2 == value.intValue()) {
            return activity.getString(R.string.division_e2);
        }
        if (3 == value.intValue()) {
            return activity.getString(R.string.division_e3);
        }
        if (4 == value.intValue()) {
            return activity.getString(R.string.division_w1);
        }
        if (5 == value.intValue()) {
            return activity.getString(R.string.division_w2);
        }
        if (6 == value.intValue()) {
            return activity.getString(R.string.division_w3);
        }
        return null;
    }

    public static String getShortPositionString(Activity activity, Integer position) {
        if (position.intValue() == 1) {
            return activity.getString(R.string.short_position_point_guard);
        }
        if (position.intValue() == 2) {
            return activity.getString(R.string.short_position_shooting_guard);
        }
        if (position.intValue() == 3) {
            return activity.getString(R.string.short_position_small_forward);
        }
        if (position.intValue() == 4) {
            return activity.getString(R.string.short_position_power_forward);
        }
        if (position.intValue() == 5) {
            return activity.getString(R.string.short_position_center);
        }
        return null;
    }

    public static String getLongPositionString(Activity activity, Integer position) {
        if (position.intValue() == 1) {
            return activity.getString(R.string.position_point_guard);
        }
        if (position.intValue() == 2) {
            return activity.getString(R.string.position_shooting_guard);
        }
        if (position.intValue() == 3) {
            return activity.getString(R.string.position_small_forward);
        }
        if (position.intValue() == 4) {
            return activity.getString(R.string.position_power_forward);
        }
        if (position.intValue() == 5) {
            return activity.getString(R.string.position_center);
        }
        return null;
    }

    public static int getTeamColor(Team team) {
        if (Constant.TEAM_E1_T1.equals(team.getName())) {
            return R.color.team_bos;
        }
        if (Constant.TEAM_E1_T2.equals(team.getName())) {
            return R.color.team_bro;
        }
        if (Constant.TEAM_E1_T3.equals(team.getName())) {
            return R.color.team_nyk;
        }
        if (Constant.TEAM_E1_T4.equals(team.getName())) {
            return R.color.team_phi;
        }
        if (Constant.TEAM_E1_T5.equals(team.getName())) {
            return R.color.team_tor;
        }
        if (Constant.TEAM_E2_T1.equals(team.getName())) {
            return R.color.team_chi;
        }
        if (Constant.TEAM_E2_T2.equals(team.getName())) {
            return R.color.team_cle;
        }
        if (Constant.TEAM_E2_T3.equals(team.getName())) {
            return R.color.team_det;
        }
        if (Constant.TEAM_E2_T4.equals(team.getName())) {
            return R.color.team_ind;
        }
        if (Constant.TEAM_E2_T5.equals(team.getName())) {
            return R.color.team_mil;
        }
        if (Constant.TEAM_E3_T1.equals(team.getName())) {
            return R.color.team_atl;
        }
        if (Constant.TEAM_E3_T2.equals(team.getName())) {
            return R.color.team_cha;
        }
        if (Constant.TEAM_E3_T3.equals(team.getName())) {
            return R.color.team_mia;
        }
        if (Constant.TEAM_E3_T4.equals(team.getName())) {
            return R.color.team_orl;
        }
        if (Constant.TEAM_E3_T5.equals(team.getName())) {
            return R.color.team_was;
        }
        if (Constant.TEAM_W1_T1.equals(team.getName())) {
            return R.color.team_dal;
        }
        if (Constant.TEAM_W1_T2.equals(team.getName())) {
            return R.color.team_hou;
        }
        if (Constant.TEAM_W1_T3.equals(team.getName())) {
            return R.color.team_mem;
        }
        if (Constant.TEAM_W1_T4.equals(team.getName())) {
            return R.color.team_nor;
        }
        if (Constant.TEAM_W1_T5.equals(team.getName())) {
            return R.color.team_san;
        }
        if (Constant.TEAM_W2_T1.equals(team.getName())) {
            return R.color.team_den;
        }
        if (Constant.TEAM_W2_T2.equals(team.getName())) {
            return R.color.team_min;
        }
        if (Constant.TEAM_W2_T3.equals(team.getName())) {
            return R.color.team_por;
        }
        if (Constant.TEAM_W2_T4.equals(team.getName())) {
            return R.color.team_okc;
        }
        if (Constant.TEAM_W2_T5.equals(team.getName())) {
            return R.color.team_uta;
        }
        if (Constant.TEAM_W3_T1.equals(team.getName())) {
            return R.color.team_gsw;
        }
        if (Constant.TEAM_W3_T2.equals(team.getName())) {
            return R.color.team_lac;
        }
        if (Constant.TEAM_W3_T3.equals(team.getName())) {
            return R.color.team_lal;
        }
        if (Constant.TEAM_W3_T4.equals(team.getName())) {
            return R.color.team_pho;
        }
        if (Constant.TEAM_W3_T5.equals(team.getName())) {
            return R.color.team_sac;
        }
        return R.color.holo_blue_dark;
    }
}
