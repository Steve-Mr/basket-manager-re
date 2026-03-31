package com.blank.bm15.model.util;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import com.blank.bm15pro.R;

/* loaded from: classes.dex */
public class Alert {
    public static AlertDialog.Builder getBuilder(Activity activity) {
        return new AlertDialog.Builder(activity, 3);
    }

    public static void showInfoDialog(Activity activity, Integer message) {
        showInfoDialog(activity, activity.getString(message.intValue()));
    }

    public static void showInfoDialog(Activity activity, String message) {
        showAlertDialog(activity, R.drawable.ic_info, R.string.info_title, message);
    }

    public static void showNoticeDialog(Activity activity, Integer message) {
        showNoticeDialog(activity, activity.getString(message.intValue()));
    }

    public static void showNoticeDialog(Activity activity, String message) {
        showAlertDialog(activity, R.drawable.ic_notice, R.string.notice_title, message);
    }

    public static void showWarningDialog(Activity activity, Integer message) {
        showWarningDialog(activity, activity.getString(message.intValue()));
    }

    public static void showWarningDialog(Activity activity, String message) {
        showAlertDialog(activity, R.drawable.ic_warning, R.string.warning_title, message);
    }

    public static void showErrorDialog(Activity activity, Integer message) {
        showErrorDialog(activity, activity.getString(message.intValue()));
    }

    public static void showErrorDialog(Activity activity, String message) {
        showAlertDialog(activity, R.drawable.ic_error, R.string.error_title, message);
    }

    private static void showAlertDialog(Activity activity, int icon, int title, String message) {
        showAlertDialog(activity, icon, activity.getString(title), message);
    }

    private static void showAlertDialog(Activity activity, int icon, String title, String message) {
        AlertDialog.Builder builder = getBuilder(activity);
        builder.setTitle(title).setMessage(message).setCancelable(false).setIcon(icon).setNegativeButton(activity.getString(R.string.button_accept), new DialogInterface.OnClickListener() { // from class: com.blank.bm15.model.util.Alert.1
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int id) {
                dialog.cancel();
            }
        });
        AlertDialog alert = builder.create();
        alert.show();
    }
}
