package com.blank.bm15.dao;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import com.blank.bm15.dao.utils.BlankBase;
import com.blank.bm15.model.object.crud.Challenge;
import com.blank.bm15.model.object.crud.DraftRound;
import com.blank.bm15.model.object.crud.Game;
import com.blank.bm15.model.object.crud.League;
import com.blank.bm15.model.object.crud.Match;
import com.blank.bm15.model.object.crud.MatchResult;
import com.blank.bm15.model.object.crud.Navigation;
import com.blank.bm15.model.object.crud.News;
import com.blank.bm15.model.object.crud.Offer;
import com.blank.bm15.model.object.crud.Player;
import com.blank.bm15.model.object.crud.Playoffs;
import com.blank.bm15.model.object.crud.Tactic;
import com.blank.bm15.model.object.crud.Team;
import com.blank.bm15.model.object.crud.Trade;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class BlankDatabaseManagement extends SQLiteOpenHelper {
    public static final int DATABASE_VERSION = 1;
    protected Context context;
    public String databaseName;

    public BlankDatabaseManagement(Context context) {
        this(context, String.valueOf(context.getString(context.getApplicationInfo().labelRes)) + ".db", null, 1);
    }

    public BlankDatabaseManagement(Context context, String name, SQLiteDatabase.CursorFactory factory, int version) {
        super(context, name, factory, version);
        this.context = context;
        this.databaseName = name;
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public String getDatabaseName() {
        return this.databaseName;
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onCreate(SQLiteDatabase db) {
        for (BlankBase obj : getBlankBaseObjects()) {
            db.execSQL(BlankDao.getQueryCreate(obj));
        }
        loadTables(db);
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        List<List<BlankBase>> list = new ArrayList<>();
        for (BlankBase obj : getBlankBaseObjects()) {
            list.add(BlankDao.getAll(db, obj));
            db.execSQL(BlankDao.getQueryDelete(obj));
        }
        Iterator<BlankBase> it = getBlankBaseObjects().iterator();
        while (it.hasNext()) {
            db.execSQL(BlankDao.getQueryCreate(it.next()));
        }
        for (List<BlankBase> aux : list) {
            BlankDao.saveOrUpdateAll(db, aux);
        }
    }

    private List<BlankBase> getBlankBaseObjects() {
        List<BlankBase> list = new ArrayList<>();
        list.add(new Challenge(this.context));
        list.add(new Navigation(this.context));
        list.add(new Game(this.context));
        list.add(new Team(this.context));
        list.add(new Tactic(this.context));
        list.add(new Player(this.context));
        list.add(new League(this.context));
        list.add(new DraftRound(this.context));
        list.add(new News(this.context));
        list.add(new Match(this.context));
        list.add(new MatchResult(this.context));
        list.add(new Offer(this.context));
        list.add(new Trade(this.context));
        list.add(new Playoffs(this.context));
        return list;
    }

    private void loadTables(SQLiteDatabase db) {
    }
}
