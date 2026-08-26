package com.blank.bm15.dao;

import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.util.Log;
import com.blank.bm15.dao.utils.BlankBase;
import com.blank.bm15.model.object.crud.Match;
import com.blank.bm15.model.object.crud.MatchResult;
import com.blank.bm15.model.object.crud.News;
import com.blank.bm15.model.object.crud.Player;
import com.blank.bm15.model.object.crud.Playoffs;
import com.blank.bm15.model.object.other.Classification;
import com.blank.bm15.model.util.Util;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class BlankDaoExtra extends BlankDao {
    public static <T extends BlankBase> List<T> getNews(T obj) {
        ArrayList arrayList = new ArrayList();
        if (obj instanceof News) {
            News news = (News) obj;
            BlankDatabaseManagement database = openDatabase(obj);
            Cursor c = null;
            try {
                try {
                    SQLiteDatabase db = database.getReadableDatabase();
                    int iniMatchday = news.getMatchday().intValue() - 30;
                    c = db.rawQuery("SELECT * FROM " + BlankDao.getTableName(obj) + " WHERE matchday < " + news.getMatchday() + " AND matchday > " + iniMatchday + " AND game = " + news.getGame().getId(), null);
                    if (c.moveToFirst()) {
                        do {
                            BlankBase blankBaseCreateNewInstance = createNewInstance(obj);
                            putCursorValuesInObject(c, blankBaseCreateNewInstance);
                            arrayList.add(blankBaseCreateNewInstance);
                        } while (c.moveToNext());
                    }
                    if (c != null) {
                        c.close();
                    }
                    closeDatabase(database);
                } catch (Exception e) {
                    Log.e(getTableName(obj), e.toString());
                    if (c != null) {
                        c.close();
                    }
                    closeDatabase(database);
                }
            } catch (Throwable th) {
                if (c != null) {
                    c.close();
                }
                closeDatabase(database);
                throw th;
            }
        }
        return arrayList;
    }

    public static <T extends BlankBase> List<T> getDevelopPlayer(T obj) {
        ArrayList arrayList = new ArrayList();
        if (obj instanceof MatchResult) {
            MatchResult object = (MatchResult) obj;
            BlankDatabaseManagement database = openDatabase(obj);
            Cursor c = null;
            try {
                try {
                    SQLiteDatabase db = database.getReadableDatabase();
                    int iniMatchday = object.getMatchday().intValue() - 10;
                    c = db.rawQuery("SELECT * FROM " + BlankDao.getTableName(obj) + " WHERE matchday > " + iniMatchday + " AND game = " + object.getGame().getId(), null);
                    if (c.moveToFirst()) {
                        do {
                            BlankBase blankBaseCreateNewInstance = createNewInstance(obj);
                            putCursorValuesInObject(c, blankBaseCreateNewInstance);
                            arrayList.add(blankBaseCreateNewInstance);
                        } while (c.moveToNext());
                    }
                    if (c != null) {
                        c.close();
                    }
                    closeDatabase(database);
                } catch (Exception e) {
                    Log.e(getTableName(obj), e.toString());
                    if (c != null) {
                        c.close();
                    }
                    closeDatabase(database);
                }
            } catch (Throwable th) {
                if (c != null) {
                    c.close();
                }
                closeDatabase(database);
                throw th;
            }
        }
        return arrayList;
    }

    public static List<MatchResult> getAllStatistics(MatchResult obj) {
        List<MatchResult> list = new ArrayList<>();
        if (obj instanceof MatchResult) {
            BlankDatabaseManagement database = openDatabase(obj);
            Cursor c = null;
            try {
                try {
                    String query = getQueryAllStatistics(obj);
                    c = database.getReadableDatabase().rawQuery(query, null);
                    if (c.moveToFirst()) {
                        do {
                            MatchResult aux = new MatchResult(obj.getContext());
                            putCursorValuesInObject(c, aux);
                            aux.setMatches(aux.getMatchday());
                            aux.setName(Util.getPlayerShortName(aux.getName()));
                            list.add(aux);
                        } while (c.moveToNext());
                    }
                    if (c != null) {
                        c.close();
                    }
                    closeDatabase(database);
                } catch (Exception e) {
                    Log.e(getTableName(obj), e.toString());
                    if (c != null) {
                        c.close();
                    }
                    closeDatabase(database);
                }
            } catch (Throwable th) {
                if (c != null) {
                    c.close();
                }
                closeDatabase(database);
                throw th;
            }
        }
        return list;
    }

    private static String getQueryAllStatistics(MatchResult obj) {
        String query = "SELECT MatchResult.player, Player.name, COUNT(MatchResult.player) as matchday, SUM(MatchResult.minutesPlayed) as minutesPlayed, SUM(MatchResult.blocks) as blocks, SUM(MatchResult.foulsMade) as foulsMade, SUM(MatchResult.passesOk) as passesOk, SUM(MatchResult.passesKo) as passesKo, SUM(MatchResult.rebounds) as rebounds, SUM(MatchResult.steals) as steals, SUM(MatchResult.shotsFreeOk) as shotsFreeOk, SUM(MatchResult.shotsFreeKo) as shotsFreeKo, SUM(MatchResult.shotsInteriorOk) as shotsInteriorOk, SUM(MatchResult.shotsInteriorKo) as shotsInteriorKo, SUM(MatchResult.shotsExteriorDoubleOk) as shotsExteriorDoubleOk, SUM(MatchResult.shotsExteriorDoubleKo) as shotsExteriorDoubleKo, SUM(MatchResult.shotsExteriorTripleOk) as shotsExteriorTripleOk, SUM(MatchResult.shotsExteriorTripleKo) as shotsExteriorTripleKo FROM MatchResult INNER JOIN Player ON MatchResult.player = Player.id WHERE MatchResult.game = " + obj.getGame().getId() + " ";
        if (obj.getPlayer().getYearsExperience() != null) {
            query = String.valueOf(query) + "AND Player.yearsExperience = " + obj.getPlayer().getYearsExperience() + " ";
        }
        if (obj.getPlayer().getPositionFirst() != null) {
            query = String.valueOf(query) + "AND Player.positionFirst = " + obj.getPlayer().getPositionFirst() + " ";
        }
        return String.valueOf(query) + "GROUP BY MatchResult.player, Player.name";
    }

    public static List<Player> getFreeAgents(Player obj) {
        List<Player> list = new ArrayList<>();
        if (obj instanceof Player) {
            BlankDatabaseManagement database = openDatabase(obj);
            Cursor c = null;
            try {
                try {
                    String query = getQueryFreeAgents(obj);
                    c = database.getReadableDatabase().rawQuery(query, null);
                    if (c.moveToFirst()) {
                        do {
                            Player aux = new Player(obj.getContext());
                            putCursorValuesInObject(c, aux);
                            list.add(aux);
                        } while (c.moveToNext());
                    }
                    if (c != null) {
                        c.close();
                    }
                    closeDatabase(database);
                } catch (Exception e) {
                    Log.e(getTableName(obj), e.toString());
                    if (c != null) {
                        c.close();
                    }
                    closeDatabase(database);
                }
            } catch (Throwable th) {
                if (c != null) {
                    c.close();
                }
                closeDatabase(database);
                throw th;
            }
        }
        return list;
    }

    private static String getQueryFreeAgents(Player obj) {
        String where = " WHERE game = " + obj.getGame().getId() + " AND team IS NULL";
        if (obj.getPositionFirst() != null) {
            where = String.valueOf(where) + " AND positionFirst = " + obj.getPositionFirst();
        }
        return String.valueOf("SELECT * FROM Player") + where;
    }

    public static List<Player> getDraftPlayers(Player obj) {
        List<Player> list = new ArrayList<>();
        if (obj instanceof Player) {
            BlankDatabaseManagement database = openDatabase(obj);
            Cursor c = null;
            try {
                try {
                    String query = getQueryDraftPlayers(obj);
                    c = database.getReadableDatabase().rawQuery(query, null);
                    if (c.moveToFirst()) {
                        do {
                            Player aux = new Player(obj.getContext());
                            putCursorValuesInObject(c, aux);
                            list.add(aux);
                        } while (c.moveToNext());
                    }
                    if (c != null) {
                        c.close();
                    }
                    closeDatabase(database);
                } catch (Exception e) {
                    Log.e(getTableName(obj), e.toString());
                    if (c != null) {
                        c.close();
                    }
                    closeDatabase(database);
                }
            } catch (Throwable th) {
                if (c != null) {
                    c.close();
                }
                closeDatabase(database);
                throw th;
            }
        }
        return list;
    }

    private static String getQueryDraftPlayers(Player obj) {
        String where = " WHERE game = " + obj.getGame().getId() + " AND team = -1";
        return String.valueOf("SELECT * FROM Player") + where;
    }

    public static List<Match> getUserMatchCalendar(Match obj) {
        List<Match> list = new ArrayList<>();
        if (obj instanceof Match) {
            BlankDatabaseManagement database = openDatabase(obj);
            Cursor c = null;
            try {
                try {
                    String query = getQueryUserMatchCalendar(obj);
                    c = database.getReadableDatabase().rawQuery(query, null);
                    if (c.moveToFirst()) {
                        do {
                            Match aux = new Match(obj.getContext());
                            putCursorValuesInObject(c, aux);
                            list.add(aux);
                        } while (c.moveToNext());
                    }
                    if (c != null) {
                        c.close();
                    }
                    closeDatabase(database);
                } catch (Exception e) {
                    Log.e(getTableName(obj), e.toString());
                    if (c != null) {
                        c.close();
                    }
                    closeDatabase(database);
                }
            } catch (Throwable th) {
                if (c != null) {
                    c.close();
                }
                closeDatabase(database);
                throw th;
            }
        }
        return list;
    }

    private static String getQueryUserMatchCalendar(Match obj) {
        String where = " WHERE game = " + obj.getGame().getId() + " AND (teamLocal = " + obj.getGame().getUserTeam().getId() + " OR teamVisitor = " + obj.getGame().getUserTeam().getId() + ")";
        if (obj.getMatchday() != null) {
            where = String.valueOf(where) + " AND matchday = " + obj.getMatchday();
        }
        return String.valueOf("SELECT * FROM Match") + where + " ORDER BY matchday ASC";
    }

    public static List<Match> getPlayedMatchesTeam(Match obj) {
        List<Match> list = new ArrayList<>();
        if (obj instanceof Match) {
            BlankDatabaseManagement database = openDatabase(obj);
            Cursor c = null;
            try {
                try {
                    String query = getQueryPlayedMatchesTeam(obj);
                    c = database.getReadableDatabase().rawQuery(query, null);
                    if (c.moveToFirst()) {
                        do {
                            Match aux = new Match(obj.getContext());
                            putCursorValuesInObject(c, aux);
                            list.add(aux);
                        } while (c.moveToNext());
                    }
                    if (c != null) {
                        c.close();
                    }
                    closeDatabase(database);
                } catch (Exception e) {
                    Log.e(getTableName(obj), e.toString());
                    if (c != null) {
                        c.close();
                    }
                    closeDatabase(database);
                }
            } catch (Throwable th) {
                if (c != null) {
                    c.close();
                }
                closeDatabase(database);
                throw th;
            }
        }
        return list;
    }

    private static String getQueryPlayedMatchesTeam(Match obj) {
        String where = " WHERE game = " + obj.getGame().getId() + " AND matchday < " + obj.getGame().getCurrentMatchday() + " AND (teamLocal = " + obj.getTeamLocal().getId() + " OR teamVisitor = " + obj.getTeamLocal().getId() + ")";
        return String.valueOf("SELECT * FROM Match") + where + " ORDER BY matchday ASC";
    }

    public static List<Classification> getClassification(Classification obj) {
        List<Classification> list = new ArrayList<>();
        if (obj instanceof Classification) {
            BlankDatabaseManagement database = openDatabase(obj);
            Cursor c = null;
            try {
                try {
                    String query = getQueryClassification(obj);
                    c = database.getReadableDatabase().rawQuery(query, null);
                    if (c.moveToFirst()) {
                        int i = 1;
                        do {
                            int i2 = i;
                            Classification aux = new Classification(obj.getContext());
                            putCursorValuesInObject(c, aux);
                            if (obj.getDivision() != null) {
                                i = i2 + 1;
                                aux.setPositionInDivision(Integer.valueOf(i2));
                            } else if (obj.getConference() != null) {
                                i = i2 + 1;
                                aux.setPositionInConference(Integer.valueOf(i2));
                            } else {
                                i = i2;
                            }
                            list.add(aux);
                        } while (c.moveToNext());
                    }
                    if (c != null) {
                        c.close();
                    }
                    closeDatabase(database);
                } catch (Exception e) {
                    Log.e(getTableName(obj), e.toString());
                    if (c != null) {
                        c.close();
                    }
                    closeDatabase(database);
                }
            } catch (Throwable th) {
                if (c != null) {
                    c.close();
                }
                closeDatabase(database);
                throw th;
            }
        }
        return list;
    }

    private static String getQueryClassification(Classification obj) {
        String where = " WHERE team.game = league.game AND team.id = league.team";
        if (obj.getGame() != null && obj.getGame().getId() != null) {
            where = String.valueOf(" WHERE team.game = league.game AND team.id = league.team") + " AND team.game = " + obj.getGame().getId();
        }
        if (obj.getDivision() != null) {
            where = String.valueOf(where) + " AND team.division = " + obj.getDivision();
        }
        if (obj.getConference() != null) {
            where = String.valueOf(where) + " AND team.conference = " + obj.getConference();
        }
        return String.valueOf("SELECT league.game AS game, league.team AS team, league.gamesLost AS gamesLost, league.gamesWon AS gamesWon, league.pointsAllowed AS pointsAllowed, league.pointsScored AS pointsScored, team.name AS name, team.conference AS conference, team.division AS division FROM Team team, League league") + where + " ORDER BY league.gamesWon DESC, league.gamesLost ASC, league.pointsScored DESC, league.pointsAllowed ASC";
    }

    public static List<Classification> getDraft(Classification obj) {
        List<Classification> list = new ArrayList<>();
        if (obj instanceof Classification) {
            BlankDatabaseManagement database = openDatabase(obj);
            Cursor c = null;
            try {
                try {
                    String query = getQueryDraft(obj);
                    c = database.getReadableDatabase().rawQuery(query, null);
                    if (c.moveToFirst()) {
                        do {
                            Classification aux = new Classification(obj.getContext());
                            putCursorValuesInObject(c, aux);
                            list.add(aux);
                        } while (c.moveToNext());
                    }
                    if (c != null) {
                        c.close();
                    }
                    closeDatabase(database);
                } catch (Exception e) {
                    Log.e(getTableName(obj), e.toString());
                    if (c != null) {
                        c.close();
                    }
                    closeDatabase(database);
                }
            } catch (Throwable th) {
                if (c != null) {
                    c.close();
                }
                closeDatabase(database);
                throw th;
            }
        }
        return list;
    }

    private static String getQueryDraft(Classification obj) {
        String where = " WHERE team.game = league.game AND team.id = league.team";
        if (obj.getGame() != null && obj.getGame().getId() != null) {
            where = String.valueOf(" WHERE team.game = league.game AND team.id = league.team") + " AND team.game = " + obj.getGame().getId();
        }
        return String.valueOf("SELECT league.game AS game, league.team AS team, league.gamesLost AS gamesLost, league.gamesWon AS gamesWon, league.pointsAllowed AS pointsAllowed, league.pointsScored AS pointsScored, team.name AS name, team.conference AS conference, team.division AS division FROM Team team, League league") + where + " ORDER BY league.gamesWon ASC, league.pointsScored ASC, league.pointsAllowed DESC";
    }

    public static List<Match> getMatchesToDeleteByPlayoffs(Playoffs obj) {
        List<Match> list = new ArrayList<>();
        if (obj instanceof Playoffs) {
            BlankDatabaseManagement database = openDatabase(obj);
            Cursor c = null;
            try {
                try {
                    String query = getQueryMatchesToDeleteByPlayoffs(obj);
                    c = database.getReadableDatabase().rawQuery(query, null);
                    if (c.moveToFirst()) {
                        do {
                            Match aux = new Match(obj.getContext());
                            putCursorValuesInObject(c, aux);
                            list.add(aux);
                        } while (c.moveToNext());
                    }
                    if (c != null) {
                        c.close();
                    }
                    closeDatabase(database);
                } catch (Exception e) {
                    Log.e(getTableName(obj), e.toString());
                    if (c != null) {
                        c.close();
                    }
                    closeDatabase(database);
                }
            } catch (Throwable th) {
                if (c != null) {
                    c.close();
                }
                closeDatabase(database);
                throw th;
            }
        }
        return list;
    }

    private static String getQueryMatchesToDeleteByPlayoffs(Playoffs obj) {
        String where = " WHERE (match.teamLocal = playoffs.team OR match.teamVisitor = playoffs.team) AND playoffs.seriesGamesWon = " + obj.getSeriesGamesWon() + " AND match.game = " + obj.getGame().getId() + " AND match.matchday > " + obj.getGame().getCurrentMatchday();
        return String.valueOf("SELECT match.id FROM Match match, Playoffs playoffs") + where;
    }
}
