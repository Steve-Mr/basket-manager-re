package com.blank.bm15.model.util;

import android.content.Context;
import android.content.SharedPreferences;

/* JADX INFO: loaded from: classes.dex */
public class BlankPreferences {
    public static void setInt(Context context, String preference, int value) {
        String sharedPrefName = context.getString(context.getApplicationInfo().labelRes);
        SharedPreferences sharedPreferences = context.getSharedPreferences(sharedPrefName, 0);
        SharedPreferences.Editor editor = sharedPreferences.edit();
        editor.putInt(preference, value);
        editor.commit();
    }

    public static int getInt(Context context, String preference, int defaultValue) {
        String sharedPrefName = context.getString(context.getApplicationInfo().labelRes);
        SharedPreferences sharedPreferences = context.getSharedPreferences(sharedPrefName, 0);
        return sharedPreferences.getInt(preference, defaultValue);
    }

    public static void setString(Context context, String preference, String value) {
        String sharedPrefName = context.getString(context.getApplicationInfo().labelRes);
        SharedPreferences sharedPreferences = context.getSharedPreferences(sharedPrefName, 0);
        SharedPreferences.Editor editor = sharedPreferences.edit();
        editor.putString(preference, value);
        editor.commit();
    }

    public static String getString(Context context, String preference, String defaultValue) {
        String sharedPrefName = context.getString(context.getApplicationInfo().labelRes);
        SharedPreferences sharedPreferences = context.getSharedPreferences(sharedPrefName, 0);
        return sharedPreferences.getString(preference, defaultValue);
    }

    public static void setBoolean(Context context, String preference, Boolean value) {
        String sharedPrefName = context.getString(context.getApplicationInfo().labelRes);
        SharedPreferences sharedPreferences = context.getSharedPreferences(sharedPrefName, 0);
        SharedPreferences.Editor editor = sharedPreferences.edit();
        editor.putBoolean(preference, value.booleanValue());
        editor.commit();
    }

    public static Boolean getBoolean(Context context, String preference, Boolean defaultValue) {
        String sharedPrefName = context.getString(context.getApplicationInfo().labelRes);
        SharedPreferences sharedPreferences = context.getSharedPreferences(sharedPrefName, 0);
        return Boolean.valueOf(sharedPreferences.getBoolean(preference, defaultValue.booleanValue()));
    }
}
