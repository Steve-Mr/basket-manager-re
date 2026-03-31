package com.blank.bm15.activity;

import android.annotation.SuppressLint;
import android.app.ActionBar;
import android.app.AlertDialog;
import android.content.ActivityNotFoundException;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Environment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.RadioGroup;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;
import com.blank.bm15.activity.adapter.AdapterGameList;
import com.blank.bm15.activity.base.BaseActivity;
import com.blank.bm15.dao.BlankDao;
import com.blank.bm15.dao.utils.BlankObj;
import com.blank.bm15.dao.utils.BlankSharedPreferences;
import com.blank.bm15.model.core.Create;
import com.blank.bm15.model.object.crud.Game;
import com.blank.bm15.model.object.crud.Match;
import com.blank.bm15.model.object.crud.MatchResult;
import com.blank.bm15.model.object.crud.Player;
import com.blank.bm15.model.object.crud.Playoffs;
import com.blank.bm15.model.object.crud.Team;
import com.blank.bm15.model.util.Alert;
import com.blank.bm15pro.R;
import java.io.File;
import java.io.FileInputStream;
import java.io.FilenameFilter;
import java.io.InputStream;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/* loaded from: classes.dex */
public class MainActivity extends BaseActivity {
    private EditText editTextUrl;
    private File selectedFile;
    private String[] strFileList;

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.blank.bm15.activity.base.BaseActivity, android.app.Activity
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    @Override // android.app.Activity
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }

    @Override // android.app.Activity
    public void onBackPressed() {
        finishAffinity();
    }

    @Override // android.app.Activity
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item != null) {
            if (item.getItemId() == R.id.mainMenuExportPlayerCsv) {
                Create.createRosterFile(this);
            } else if (item.getItemId() == R.id.mainMenuExportTeam) {
                Team export = new Team(this);
                BlankDao.exportToCSV(BlankDao.getAll(export));
            } else if (item.getItemId() == R.id.mainMenuExportMatch) {
                Match export2 = new Match(this);
                BlankDao.exportToCSV(BlankDao.getAll(export2));
            } else if (item.getItemId() == R.id.mainMenuExportMatchResult) {
                MatchResult export3 = new MatchResult(this);
                BlankDao.exportToCSV(BlankDao.getAll(export3));
            } else if (item.getItemId() == R.id.mainMenuExportPlayer) {
                Player export4 = new Player(this);
                BlankDao.exportToCSV(BlankDao.getAll(export4));
            } else if (item.getItemId() == R.id.mainMenuExportPlayoffs) {
                Playoffs export5 = new Playoffs(this);
                BlankDao.exportToCSV(BlankDao.getAll(export5));
            }
        }
        return super.onOptionsItemSelected(item);
    }

    @Override // android.app.Activity
    protected void onResume() {
        super.onResume();
        hideProcessBar();
        createPage();
    }

    public void onClickBM15PRO(View view) {
        try {
            startActivity(new Intent("android.intent.action.VIEW", Uri.parse("market://details?id=com.blank.bm16pro")));
        } catch (ActivityNotFoundException e) {
            startActivity(new Intent("android.intent.action.VIEW", Uri.parse("http://play.google.com/store/apps/details?id=com.blank.bm16pro")));
        }
    }

    @SuppressLint({"InflateParams"})
    public void onClickGameNewDefault(View view) {
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        LayoutInflater inflater = getLayoutInflater();
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm");
        String currentDate = sdf.format(new Date());
        View dialogView = inflater.inflate(R.layout.dialog_new_game_default, (ViewGroup) null);
        final EditText editText = (EditText) dialogView.findViewById(R.id.dialogNewGameDefaultEditTextName);
        editText.setText(currentDate);
        final RadioGroup radioGroup = (RadioGroup) dialogView.findViewById(R.id.dialogNewGameDefaultRadioGroupType);
        builder.setView(dialogView).setPositiveButton(getString(R.string.button_create), new DialogInterface.OnClickListener() { // from class: com.blank.bm15.activity.MainActivity.1
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int id) {
                String name = BlankObj.toString(editText.getText());
                if ("".equals(name)) {
                    Alert.showErrorDialog(MainActivity.this, MainActivity.this.getResources().getString(R.string.error_game_new));
                    return;
                }
                dialog.cancel();
                InputStream is = null;
                URL url = null;
                if (radioGroup.getCheckedRadioButtonId() == R.id.dialogNewGameDefaultRadioButtonOnline) {
                    try {
                        String strUrl = MainActivity.this.getString(R.string.main_default_rosters_url);
                        url = new URL(strUrl);
                    } catch (Exception e) {
                        Log.e("MainActivity", e.toString());
                    }
                } else {
                    is = MainActivity.this.getResources().openRawResource(R.raw.rosters);
                }
                MainActivity.this.createGameInThread(name, is, url);
            }
        }).setNegativeButton(getString(R.string.button_cancel), new DialogInterface.OnClickListener() { // from class: com.blank.bm15.activity.MainActivity.2
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int id) {
                dialog.cancel();
            }
        });
        this.alertDialog = builder.create();
        this.alertDialog.show();
    }

    @SuppressLint({"InflateParams"})
    public void onClickGameNewCustom(View view) {
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        LayoutInflater inflater = getLayoutInflater();
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm");
        String currentDate = sdf.format(new Date());
        View dialogView = inflater.inflate(R.layout.dialog_new_game_custom, (ViewGroup) null);
        final EditText editText = (EditText) dialogView.findViewById(R.id.dialogNewGameCustomEditTextName);
        editText.setText(currentDate);
        this.editTextUrl = (EditText) dialogView.findViewById(R.id.dialogNewGameCustomEditTextUrl);
        final RadioGroup radioGroup = (RadioGroup) dialogView.findViewById(R.id.dialogNewGameCustomRadioGroupType);
        radioGroup.setOnCheckedChangeListener(new RadioGroup.OnCheckedChangeListener() { // from class: com.blank.bm15.activity.MainActivity.3
            @Override // android.widget.RadioGroup.OnCheckedChangeListener
            public void onCheckedChanged(RadioGroup group, int checkedId) {
                MainActivity.this.editTextUrl.setText("");
                if (checkedId == R.id.dialogNewGameCustomRadioButtonOnline) {
                    MainActivity.this.editTextUrl.setEnabled(Boolean.TRUE.booleanValue());
                } else {
                    MainActivity.this.editTextUrl.setEnabled(Boolean.FALSE.booleanValue());
                    MainActivity.this.onChoseFileCreateDialog();
                }
            }
        });
        builder.setView(dialogView).setPositiveButton(getString(R.string.button_create), new DialogInterface.OnClickListener() { // from class: com.blank.bm15.activity.MainActivity.4
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int id) {
                String name = BlankObj.toString(editText.getText());
                String strUrl = BlankObj.toString(MainActivity.this.editTextUrl.getText());
                if ("".equals(name)) {
                    Alert.showErrorDialog(MainActivity.this, MainActivity.this.getResources().getString(R.string.error_game_new));
                    return;
                }
                dialog.cancel();
                InputStream is = null;
                URL url = null;
                try {
                    if (radioGroup.getCheckedRadioButtonId() == R.id.dialogNewGameCustomRadioButtonOnline) {
                        url = new URL(strUrl);
                    } else {
                        is = new FileInputStream(MainActivity.this.selectedFile);
                    }
                } catch (Exception e) {
                    Log.e("MainActivity", e.toString());
                }
                MainActivity.this.createGameInThread(name, is, url);
            }
        }).setNegativeButton(getString(R.string.button_cancel), new DialogInterface.OnClickListener() { // from class: com.blank.bm15.activity.MainActivity.5
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int id) {
                dialog.cancel();
            }
        });
        this.alertDialog = builder.create();
        this.alertDialog.show();
    }

    protected void onChoseFileCreateDialog() {
        String subfolder = getString(getApplicationInfo().labelRes);
        final File sdCardDir = new File(Environment.getExternalStorageDirectory() + "/" + subfolder);
        if (!sdCardDir.exists()) {
            sdCardDir.mkdir();
        }
        if (sdCardDir.exists()) {
            FilenameFilter filter = new FilenameFilter() { // from class: com.blank.bm15.activity.MainActivity.6
                @Override // java.io.FilenameFilter
                public boolean accept(File dir, String filename) {
                    File sel = new File(dir, filename);
                    return filename.contains(".csv") || sel.isDirectory();
                }
            };
            this.strFileList = sdCardDir.list(filter);
        } else {
            this.strFileList = null;
        }
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setTitle(String.format(getString(R.string.info_load_file_folder), subfolder));
        if (this.strFileList != null && this.strFileList.length != 0) {
            builder.setItems(this.strFileList, new DialogInterface.OnClickListener() { // from class: com.blank.bm15.activity.MainActivity.7
                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialog, int which) {
                    MainActivity.this.selectedFile = new File(sdCardDir, MainActivity.this.strFileList[which]);
                    MainActivity.this.editTextUrl.setText(MainActivity.this.strFileList[which]);
                }
            });
            builder.show();
        } else {
            Alert.showErrorDialog(this, String.format(getString(R.string.error_no_files_found), subfolder));
        }
    }

    private void createPage() {
        ActionBar actionBar = getActionBar();
        actionBar.setDisplayHomeAsUpEnabled(Boolean.FALSE.booleanValue());
        List<Game> gameList = BlankDao.getAll(new Game(this));
        final ListView listView = (ListView) findViewById(R.id.mainListViewGames);
        listView.setAdapter((ListAdapter) new AdapterGameList(this, R.layout.spinner_game, gameList));
        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() { // from class: com.blank.bm15.activity.MainActivity.8
            @Override // android.widget.AdapterView.OnItemClickListener
            public void onItemClick(AdapterView<?> arg0, View arg1, int position, long arg3) {
                Game game = (Game) listView.getItemAtPosition(position);
                MainActivity.this.setGame(game);
                BlankSharedPreferences.setInt(MainActivity.this, "GAME_ID", game.getId().intValue());
                BaseActivity.resetNavigation(MainActivity.this, 15, null);
                if (game.getUserTeam().getId() != null) {
                    MainActivity.this.startActivity(new Intent(MainActivity.this, (Class<?>) HomeActivity.class));
                } else {
                    MainActivity.this.startActivity(new Intent(MainActivity.this, (Class<?>) SelectTeamActivity.class));
                }
            }
        });
        listView.setOnItemLongClickListener(new AdapterView.OnItemLongClickListener() { // from class: com.blank.bm15.activity.MainActivity.9
            @Override // android.widget.AdapterView.OnItemLongClickListener
            public boolean onItemLongClick(AdapterView<?> arg0, View arg1, int position, long arg3) {
                final Game game = (Game) listView.getItemAtPosition(position);
                AlertDialog.Builder builder = Alert.getBuilder(MainActivity.this);
                builder.setTitle(MainActivity.this.getString(R.string.warning_title)).setMessage(MainActivity.this.getString(R.string.warning_game_delete)).setCancelable(false).setIcon(R.drawable.ic_warning).setPositiveButton(MainActivity.this.getString(R.string.button_accept), new DialogInterface.OnClickListener() { // from class: com.blank.bm15.activity.MainActivity.9.1
                    @Override // android.content.DialogInterface.OnClickListener
                    public void onClick(DialogInterface dialog, int id) {
                        MainActivity.this.deleteGameInThread(game);
                    }
                }).setNegativeButton(MainActivity.this.getString(R.string.button_cancel), new DialogInterface.OnClickListener() { // from class: com.blank.bm15.activity.MainActivity.9.2
                    @Override // android.content.DialogInterface.OnClickListener
                    public void onClick(DialogInterface dialog, int id) {
                        dialog.cancel();
                    }
                });
                MainActivity.this.alertDialog = builder.create();
                MainActivity.this.alertDialog.show();
                return Boolean.TRUE.booleanValue();
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void createGameInThread(final String name, final InputStream is, final URL url) {
        showProcessBar(R.string.main_creating_title);
        new Thread(new Runnable() { // from class: com.blank.bm15.activity.MainActivity.10
            @Override // java.lang.Runnable
            public void run() {
                InputStream inputStream = is;
                if (inputStream == null && url != null) {
                    try {
                        inputStream = url.openStream();
                    } catch (Exception e) {
                        Log.e("MainActivity", e.toString());
                    }
                }
                Game game = Create.newGame(MainActivity.this, name, inputStream);
                MainActivity.this.setGame(game);
                if (!game.getCreateOnlinePlayersOk().booleanValue()) {
                    Create.deleteGame(game);
                    MainActivity.this.showToastError();
                    MainActivity.this.startActivity(new Intent(MainActivity.this, (Class<?>) MainActivity.class));
                } else {
                    BlankSharedPreferences.setInt(MainActivity.this, "GAME_ID", game.getId().intValue());
                    BaseActivity.resetNavigation(MainActivity.this, 15, null);
                    MainActivity.this.startActivity(new Intent(MainActivity.this, (Class<?>) SelectTeamActivity.class));
                }
            }
        }).start();
    }

    public void deleteGameInThread(final Game game) {
        showProcessBar(R.string.main_deleting_title);
        new Thread(new Runnable() { // from class: com.blank.bm15.activity.MainActivity.11
            @Override // java.lang.Runnable
            public void run() {
                Create.deleteGame(game);
                MainActivity.this.startActivity(new Intent(MainActivity.this, (Class<?>) MainActivity.class));
            }
        }).start();
    }

    private void showProcessBar(int title) {
        Button button = (Button) findViewById(R.id.mainButtonGameNewDefault);
        button.setVisibility(4);
        Button buttonOnline = (Button) findViewById(R.id.mainButtonGameNewCustom);
        buttonOnline.setVisibility(4);
        TextView textViewInfo = (TextView) findViewById(R.id.mainTextViewInfo);
        textViewInfo.setVisibility(4);
        ListView listView = (ListView) findViewById(R.id.mainListViewGames);
        listView.setVisibility(4);
        RelativeLayout layout = (RelativeLayout) findViewById(R.id.mainRelativeLayoutProgressBar);
        layout.setVisibility(0);
        TextView textViewTitle = (TextView) findViewById(R.id.mainTextViewProcessBarTitle);
        textViewTitle.setText(getResources().getString(title));
    }

    private void hideProcessBar() {
        Button button = (Button) findViewById(R.id.mainButtonGameNewDefault);
        button.setVisibility(0);
        Button buttonOnline = (Button) findViewById(R.id.mainButtonGameNewCustom);
        buttonOnline.setVisibility(0);
        TextView textViewInfo = (TextView) findViewById(R.id.mainTextViewInfo);
        textViewInfo.setVisibility(0);
        ListView listView = (ListView) findViewById(R.id.mainListViewGames);
        listView.setVisibility(0);
        RelativeLayout layout = (RelativeLayout) findViewById(R.id.mainRelativeLayoutProgressBar);
        layout.setVisibility(8);
    }

    public void showToastError() {
        runOnUiThread(new Runnable() { // from class: com.blank.bm15.activity.MainActivity.12
            @Override // java.lang.Runnable
            public void run() {
                Toast toast = Toast.makeText(MainActivity.this, MainActivity.this.getString(R.string.error_create_roster), 1);
                toast.setGravity(17, 0, 0);
                toast.show();
            }
        });
    }
}
