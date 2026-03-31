package com.blank.bm15.activity.base;

import android.app.ActionBar;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.os.Bundle;
import android.widget.Toast;
import com.blank.bm15.dao.BlankDao;
import com.blank.bm15.dao.utils.BlankSharedPreferences;
import com.blank.bm15.model.comparator.NavigationComparator;
import com.blank.bm15.model.object.crud.Game;
import com.blank.bm15.model.object.crud.Navigation;
import com.google.android.gms.ads.InterstitialAd;
import java.util.Collections;
import java.util.List;

/* loaded from: classes.dex */
public class BaseActivity extends Activity {
    public AlertDialog alertDialog;
    private Game game = null;
    public InterstitialAd interstitialAd;

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.app.Activity
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        ActionBar actionBar = getActionBar();
        actionBar.setDisplayHomeAsUpEnabled(Boolean.TRUE.booleanValue());
    }

    public Game getGame() {
        int id = BlankSharedPreferences.getInt(this, "GAME_ID", 0);
        if (this.game == null || this.game.getId() == null || this.game.getId().intValue() != id) {
            this.game = new Game(this);
            this.game.setId(Integer.valueOf(id));
            BlankDao.loadById(this.game);
        }
        return this.game;
    }

    public void setGame(Game game) {
        this.game = game;
    }

    public void showShortToast(String message) {
        Toast toast = Toast.makeText(this, message, 0);
        toast.setGravity(17, 0, 0);
        toast.show();
    }

    public static void resetNavigation(Context context, Integer idFragment, Integer idObject) {
        BlankDao.deleteAll(BlankDao.getAll(new Navigation(context)));
        addNavigation(context, idFragment, idObject);
    }

    public static void addNavigation(Context context, Integer idFragment, Integer idObject) {
        Navigation navigation = new Navigation(context);
        navigation.setIdFragment(idFragment);
        navigation.setIdObject(idObject);
        BlankDao.saveOrUpdate(navigation);
    }

    public static Navigation deleteLastNavigation(Context context) {
        List<Navigation> list = BlankDao.getAll(new Navigation(context));
        if (!list.isEmpty()) {
            Collections.sort(list, new NavigationComparator());
            BlankDao.delete(list.get(0));
        }
        return getNavigation(context);
    }

    public static Navigation getNavigation(Context context) {
        List<Navigation> list = BlankDao.getAll(new Navigation(context));
        if (!list.isEmpty()) {
            Collections.sort(list, new NavigationComparator());
            return list.get(0);
        }
        Navigation navigation = new Navigation(context);
        navigation.setIdFragment(15);
        return navigation;
    }
}
