package com.blank.bm15.dao;

import android.database.Cursor;
import android.util.Log;
import com.blank.bm15.model.object.crud.Match;
import com.blank.bm15.model.object.crud.MatchResult;
import com.blank.bm15.model.object.crud.Player;
import com.blank.bm15.model.object.crud.Playoffs;
import com.blank.bm15.model.object.other.Classification;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes.dex */
public class BlankDaoExtra extends BlankDao {
    /* JADX WARN: Code restructure failed: missing block: B:12:0x0077, code lost:

        if (r1 == null) goto L11;
     */
    /* JADX WARN: Code restructure failed: missing block: B:13:0x0079, code lost:

        r1.close();
     */
    /* JADX WARN: Code restructure failed: missing block: B:14:0x007c, code lost:

        closeDatabase(r2);
     */
    /* JADX WARN: Code restructure failed: missing block: B:6:0x0065, code lost:

        if (r1.moveToFirst() != false) goto L7;
     */
    /* JADX WARN: Code restructure failed: missing block: B:7:0x0067, code lost:

        r0 = createNewInstance(r10);
        putCursorValuesInObject(r1, r0);
        r6.add(r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:8:0x0075, code lost:

        if (r1.moveToNext() != false) goto L27;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static <T extends com.blank.bm15.dao.utils.BlankBase> java.util.List<T> getNews(T r10) {
        /*
            java.util.ArrayList r6 = new java.util.ArrayList
            r6.<init>()
            boolean r8 = r10 instanceof com.blank.bm15.model.object.crud.News
            if (r8 == 0) goto L7f
            r7 = r10
            com.blank.bm15.model.object.crud.News r7 = (com.blank.bm15.model.object.crud.News) r7
            com.blank.bm15.dao.BlankDatabaseManagement r2 = openDatabase(r10)
            r1 = 0
            android.database.sqlite.SQLiteDatabase r3 = r2.getReadableDatabase()     // Catch: java.lang.Exception -> L80 java.lang.Throwable -> L95
            java.lang.Integer r8 = r7.getMatchday()     // Catch: java.lang.Exception -> L80 java.lang.Throwable -> L95
            int r8 = r8.intValue()     // Catch: java.lang.Exception -> L80 java.lang.Throwable -> L95
            int r5 = r8 + (-30)
            java.lang.StringBuilder r8 = new java.lang.StringBuilder     // Catch: java.lang.Exception -> L80 java.lang.Throwable -> L95
            java.lang.String r9 = "SELECT * FROM "
            r8.<init>(r9)     // Catch: java.lang.Exception -> L80 java.lang.Throwable -> L95
            java.lang.String r9 = com.blank.bm15.dao.BlankDao.getTableName(r10)     // Catch: java.lang.Exception -> L80 java.lang.Throwable -> L95
            java.lang.StringBuilder r8 = r8.append(r9)     // Catch: java.lang.Exception -> L80 java.lang.Throwable -> L95
            java.lang.String r9 = " WHERE matchday < "
            java.lang.StringBuilder r8 = r8.append(r9)     // Catch: java.lang.Exception -> L80 java.lang.Throwable -> L95
            java.lang.Integer r9 = r7.getMatchday()     // Catch: java.lang.Exception -> L80 java.lang.Throwable -> L95
            java.lang.StringBuilder r8 = r8.append(r9)     // Catch: java.lang.Exception -> L80 java.lang.Throwable -> L95
            java.lang.String r9 = " AND matchday > "
            java.lang.StringBuilder r8 = r8.append(r9)     // Catch: java.lang.Exception -> L80 java.lang.Throwable -> L95
            java.lang.StringBuilder r8 = r8.append(r5)     // Catch: java.lang.Exception -> L80 java.lang.Throwable -> L95
            java.lang.String r9 = " AND game = "
            java.lang.StringBuilder r8 = r8.append(r9)     // Catch: java.lang.Exception -> L80 java.lang.Throwable -> L95
            com.blank.bm15.model.object.crud.Game r9 = r7.getGame()     // Catch: java.lang.Exception -> L80 java.lang.Throwable -> L95
            java.lang.Integer r9 = r9.getId()     // Catch: java.lang.Exception -> L80 java.lang.Throwable -> L95
            java.lang.StringBuilder r8 = r8.append(r9)     // Catch: java.lang.Exception -> L80 java.lang.Throwable -> L95
            java.lang.String r8 = r8.toString()     // Catch: java.lang.Exception -> L80 java.lang.Throwable -> L95
            r9 = 0
            android.database.Cursor r1 = r3.rawQuery(r8, r9)     // Catch: java.lang.Exception -> L80 java.lang.Throwable -> L95
            boolean r8 = r1.moveToFirst()     // Catch: java.lang.Exception -> L80 java.lang.Throwable -> L95
            if (r8 == 0) goto L77
        L67:
            com.blank.bm15.dao.utils.BlankBase r0 = createNewInstance(r10)     // Catch: java.lang.Exception -> L80 java.lang.Throwable -> L95
            putCursorValuesInObject(r1, r0)     // Catch: java.lang.Exception -> L80 java.lang.Throwable -> L95
            r6.add(r0)     // Catch: java.lang.Exception -> L80 java.lang.Throwable -> L95
            boolean r8 = r1.moveToNext()     // Catch: java.lang.Exception -> L80 java.lang.Throwable -> L95
            if (r8 != 0) goto L67
        L77:
            if (r1 == 0) goto L7c
            r1.close()
        L7c:
            closeDatabase(r2)
        L7f:
            return r6
        L80:
            r4 = move-exception
            java.lang.String r8 = getTableName(r10)     // Catch: java.lang.Throwable -> L95
            java.lang.String r9 = r4.toString()     // Catch: java.lang.Throwable -> L95
            android.util.Log.e(r8, r9)     // Catch: java.lang.Throwable -> L95
            if (r1 == 0) goto L91
            r1.close()
        L91:
            closeDatabase(r2)
            goto L7f
        L95:
            r8 = move-exception
            if (r1 == 0) goto L9b
            r1.close()
        L9b:
            closeDatabase(r2)
            throw r8
        */
        throw new UnsupportedOperationException("Method not decompiled: com.blank.bm15.dao.BlankDaoExtra.getNews(com.blank.bm15.dao.utils.BlankBase):java.util.List");
    }

    /* JADX WARN: Code restructure failed: missing block: B:12:0x0069, code lost:

        if (r1 == null) goto L11;
     */
    /* JADX WARN: Code restructure failed: missing block: B:13:0x006b, code lost:

        r1.close();
     */
    /* JADX WARN: Code restructure failed: missing block: B:14:0x006e, code lost:

        closeDatabase(r2);
     */
    /* JADX WARN: Code restructure failed: missing block: B:6:0x0057, code lost:

        if (r1.moveToFirst() != false) goto L7;
     */
    /* JADX WARN: Code restructure failed: missing block: B:7:0x0059, code lost:

        r0 = createNewInstance(r10);
        putCursorValuesInObject(r1, r0);
        r6.add(r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:8:0x0067, code lost:

        if (r1.moveToNext() != false) goto L26;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static <T extends com.blank.bm15.dao.utils.BlankBase> java.util.List<T> getDevelopPlayer(T r10) {
        /*
            java.util.ArrayList r6 = new java.util.ArrayList
            r6.<init>()
            boolean r8 = r10 instanceof com.blank.bm15.model.object.crud.MatchResult
            if (r8 == 0) goto L71
            r7 = r10
            com.blank.bm15.model.object.crud.MatchResult r7 = (com.blank.bm15.model.object.crud.MatchResult) r7
            com.blank.bm15.dao.BlankDatabaseManagement r2 = openDatabase(r10)
            r1 = 0
            android.database.sqlite.SQLiteDatabase r3 = r2.getReadableDatabase()     // Catch: java.lang.Exception -> L72 java.lang.Throwable -> L87
            java.lang.Integer r8 = r7.getMatchday()     // Catch: java.lang.Exception -> L72 java.lang.Throwable -> L87
            int r8 = r8.intValue()     // Catch: java.lang.Exception -> L72 java.lang.Throwable -> L87
            int r5 = r8 + (-10)
            java.lang.StringBuilder r8 = new java.lang.StringBuilder     // Catch: java.lang.Exception -> L72 java.lang.Throwable -> L87
            java.lang.String r9 = "SELECT * FROM "
            r8.<init>(r9)     // Catch: java.lang.Exception -> L72 java.lang.Throwable -> L87
            java.lang.String r9 = com.blank.bm15.dao.BlankDao.getTableName(r10)     // Catch: java.lang.Exception -> L72 java.lang.Throwable -> L87
            java.lang.StringBuilder r8 = r8.append(r9)     // Catch: java.lang.Exception -> L72 java.lang.Throwable -> L87
            java.lang.String r9 = " WHERE matchday > "
            java.lang.StringBuilder r8 = r8.append(r9)     // Catch: java.lang.Exception -> L72 java.lang.Throwable -> L87
            java.lang.StringBuilder r8 = r8.append(r5)     // Catch: java.lang.Exception -> L72 java.lang.Throwable -> L87
            java.lang.String r9 = " AND game = "
            java.lang.StringBuilder r8 = r8.append(r9)     // Catch: java.lang.Exception -> L72 java.lang.Throwable -> L87
            com.blank.bm15.model.object.crud.Game r9 = r7.getGame()     // Catch: java.lang.Exception -> L72 java.lang.Throwable -> L87
            java.lang.Integer r9 = r9.getId()     // Catch: java.lang.Exception -> L72 java.lang.Throwable -> L87
            java.lang.StringBuilder r8 = r8.append(r9)     // Catch: java.lang.Exception -> L72 java.lang.Throwable -> L87
            java.lang.String r8 = r8.toString()     // Catch: java.lang.Exception -> L72 java.lang.Throwable -> L87
            r9 = 0
            android.database.Cursor r1 = r3.rawQuery(r8, r9)     // Catch: java.lang.Exception -> L72 java.lang.Throwable -> L87
            boolean r8 = r1.moveToFirst()     // Catch: java.lang.Exception -> L72 java.lang.Throwable -> L87
            if (r8 == 0) goto L69
        L59:
            com.blank.bm15.dao.utils.BlankBase r0 = createNewInstance(r10)     // Catch: java.lang.Exception -> L72 java.lang.Throwable -> L87
            putCursorValuesInObject(r1, r0)     // Catch: java.lang.Exception -> L72 java.lang.Throwable -> L87
            r6.add(r0)     // Catch: java.lang.Exception -> L72 java.lang.Throwable -> L87
            boolean r8 = r1.moveToNext()     // Catch: java.lang.Exception -> L72 java.lang.Throwable -> L87
            if (r8 != 0) goto L59
        L69:
            if (r1 == 0) goto L6e
            r1.close()
        L6e:
            closeDatabase(r2)
        L71:
            return r6
        L72:
            r4 = move-exception
            java.lang.String r8 = getTableName(r10)     // Catch: java.lang.Throwable -> L87
            java.lang.String r9 = r4.toString()     // Catch: java.lang.Throwable -> L87
            android.util.Log.e(r8, r9)     // Catch: java.lang.Throwable -> L87
            if (r1 == 0) goto L83
            r1.close()
        L83:
            closeDatabase(r2)
            goto L71
        L87:
            r8 = move-exception
            if (r1 == 0) goto L8d
            r1.close()
        L8d:
            closeDatabase(r2)
            throw r8
        */
        throw new UnsupportedOperationException("Method not decompiled: com.blank.bm15.dao.BlankDaoExtra.getDevelopPlayer(com.blank.bm15.dao.utils.BlankBase):java.util.List");
    }

    /* JADX WARN: Code restructure failed: missing block: B:12:0x0048, code lost:

        if (r1 == null) goto L11;
     */
    /* JADX WARN: Code restructure failed: missing block: B:13:0x004a, code lost:

        r1.close();
     */
    /* JADX WARN: Code restructure failed: missing block: B:14:0x004d, code lost:

        closeDatabase(r2);
     */
    /* JADX WARN: Code restructure failed: missing block: B:6:0x001f, code lost:

        if (r1.moveToFirst() != false) goto L7;
     */
    /* JADX WARN: Code restructure failed: missing block: B:7:0x0021, code lost:

        r0 = new com.blank.bm15.model.object.crud.MatchResult(r8.getContext());
        putCursorValuesInObject(r1, r0);
        r0.setMatches(r0.getMatchday());
        r0.setName(com.blank.bm15.model.util.Util.getPlayerShortName(r0.getName()));
        r4.add(r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:8:0x0046, code lost:

        if (r1.moveToNext() != false) goto L26;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.util.List<com.blank.bm15.model.object.crud.MatchResult> getAllStatistics(com.blank.bm15.model.object.crud.MatchResult r8) {
        /*
            java.util.ArrayList r4 = new java.util.ArrayList
            r4.<init>()
            boolean r6 = r8 instanceof com.blank.bm15.model.object.crud.MatchResult
            if (r6 == 0) goto L50
            com.blank.bm15.dao.BlankDatabaseManagement r2 = openDatabase(r8)
            r1 = 0
            java.lang.String r5 = getQueryAllStatistics(r8)     // Catch: java.lang.Exception -> L51 java.lang.Throwable -> L66
            android.database.sqlite.SQLiteDatabase r6 = r2.getReadableDatabase()     // Catch: java.lang.Exception -> L51 java.lang.Throwable -> L66
            r7 = 0
            android.database.Cursor r1 = r6.rawQuery(r5, r7)     // Catch: java.lang.Exception -> L51 java.lang.Throwable -> L66
            boolean r6 = r1.moveToFirst()     // Catch: java.lang.Exception -> L51 java.lang.Throwable -> L66
            if (r6 == 0) goto L48
        L21:
            com.blank.bm15.model.object.crud.MatchResult r0 = new com.blank.bm15.model.object.crud.MatchResult     // Catch: java.lang.Exception -> L51 java.lang.Throwable -> L66
            android.content.Context r6 = r8.getContext()     // Catch: java.lang.Exception -> L51 java.lang.Throwable -> L66
            r0.<init>(r6)     // Catch: java.lang.Exception -> L51 java.lang.Throwable -> L66
            putCursorValuesInObject(r1, r0)     // Catch: java.lang.Exception -> L51 java.lang.Throwable -> L66
            java.lang.Integer r6 = r0.getMatchday()     // Catch: java.lang.Exception -> L51 java.lang.Throwable -> L66
            r0.setMatches(r6)     // Catch: java.lang.Exception -> L51 java.lang.Throwable -> L66
            java.lang.String r6 = r0.getName()     // Catch: java.lang.Exception -> L51 java.lang.Throwable -> L66
            java.lang.String r6 = com.blank.bm15.model.util.Util.getPlayerShortName(r6)     // Catch: java.lang.Exception -> L51 java.lang.Throwable -> L66
            r0.setName(r6)     // Catch: java.lang.Exception -> L51 java.lang.Throwable -> L66
            r4.add(r0)     // Catch: java.lang.Exception -> L51 java.lang.Throwable -> L66
            boolean r6 = r1.moveToNext()     // Catch: java.lang.Exception -> L51 java.lang.Throwable -> L66
            if (r6 != 0) goto L21
        L48:
            if (r1 == 0) goto L4d
            r1.close()
        L4d:
            closeDatabase(r2)
        L50:
            return r4
        L51:
            r3 = move-exception
            java.lang.String r6 = getTableName(r8)     // Catch: java.lang.Throwable -> L66
            java.lang.String r7 = r3.toString()     // Catch: java.lang.Throwable -> L66
            android.util.Log.e(r6, r7)     // Catch: java.lang.Throwable -> L66
            if (r1 == 0) goto L62
            r1.close()
        L62:
            closeDatabase(r2)
            goto L50
        L66:
            r6 = move-exception
            if (r1 == 0) goto L6c
            r1.close()
        L6c:
            closeDatabase(r2)
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: com.blank.bm15.dao.BlankDaoExtra.getAllStatistics(com.blank.bm15.model.object.crud.MatchResult):java.util.List");
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

    /* JADX WARN: Code restructure failed: missing block: B:12:0x0036, code lost:

        if (r1 == null) goto L11;
     */
    /* JADX WARN: Code restructure failed: missing block: B:13:0x0038, code lost:

        r1.close();
     */
    /* JADX WARN: Code restructure failed: missing block: B:14:0x003b, code lost:

        closeDatabase(r2);
     */
    /* JADX WARN: Code restructure failed: missing block: B:6:0x001f, code lost:

        if (r1.moveToFirst() != false) goto L7;
     */
    /* JADX WARN: Code restructure failed: missing block: B:7:0x0021, code lost:

        r0 = new com.blank.bm15.model.object.crud.Player(r8.getContext());
        putCursorValuesInObject(r1, r0);
        r4.add(r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:8:0x0034, code lost:

        if (r1.moveToNext() != false) goto L27;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.util.List<com.blank.bm15.model.object.crud.Player> getFreeAgents(com.blank.bm15.model.object.crud.Player r8) {
        /*
            java.util.ArrayList r4 = new java.util.ArrayList
            r4.<init>()
            boolean r6 = r8 instanceof com.blank.bm15.model.object.crud.Player
            if (r6 == 0) goto L3e
            com.blank.bm15.dao.BlankDatabaseManagement r2 = openDatabase(r8)
            r1 = 0
            java.lang.String r5 = getQueryFreeAgents(r8)     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            android.database.sqlite.SQLiteDatabase r6 = r2.getReadableDatabase()     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            r7 = 0
            android.database.Cursor r1 = r6.rawQuery(r5, r7)     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            boolean r6 = r1.moveToFirst()     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            if (r6 == 0) goto L36
        L21:
            com.blank.bm15.model.object.crud.Player r0 = new com.blank.bm15.model.object.crud.Player     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            android.content.Context r6 = r8.getContext()     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            r0.<init>(r6)     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            putCursorValuesInObject(r1, r0)     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            r4.add(r0)     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            boolean r6 = r1.moveToNext()     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            if (r6 != 0) goto L21
        L36:
            if (r1 == 0) goto L3b
            r1.close()
        L3b:
            closeDatabase(r2)
        L3e:
            return r4
        L3f:
            r3 = move-exception
            java.lang.String r6 = getTableName(r8)     // Catch: java.lang.Throwable -> L54
            java.lang.String r7 = r3.toString()     // Catch: java.lang.Throwable -> L54
            android.util.Log.e(r6, r7)     // Catch: java.lang.Throwable -> L54
            if (r1 == 0) goto L50
            r1.close()
        L50:
            closeDatabase(r2)
            goto L3e
        L54:
            r6 = move-exception
            if (r1 == 0) goto L5a
            r1.close()
        L5a:
            closeDatabase(r2)
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: com.blank.bm15.dao.BlankDaoExtra.getFreeAgents(com.blank.bm15.model.object.crud.Player):java.util.List");
    }

    private static String getQueryFreeAgents(Player obj) {
        String where = " WHERE game = " + obj.getGame().getId() + " AND team IS NULL";
        if (obj.getPositionFirst() != null) {
            where = String.valueOf(where) + " AND positionFirst = " + obj.getPositionFirst();
        }
        return String.valueOf("SELECT * FROM Player") + where;
    }

    /* JADX WARN: Code restructure failed: missing block: B:12:0x0036, code lost:

        if (r1 == null) goto L11;
     */
    /* JADX WARN: Code restructure failed: missing block: B:13:0x0038, code lost:

        r1.close();
     */
    /* JADX WARN: Code restructure failed: missing block: B:14:0x003b, code lost:

        closeDatabase(r2);
     */
    /* JADX WARN: Code restructure failed: missing block: B:6:0x001f, code lost:

        if (r1.moveToFirst() != false) goto L7;
     */
    /* JADX WARN: Code restructure failed: missing block: B:7:0x0021, code lost:

        r0 = new com.blank.bm15.model.object.crud.Player(r8.getContext());
        putCursorValuesInObject(r1, r0);
        r4.add(r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:8:0x0034, code lost:

        if (r1.moveToNext() != false) goto L27;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.util.List<com.blank.bm15.model.object.crud.Player> getDraftPlayers(com.blank.bm15.model.object.crud.Player r8) {
        /*
            java.util.ArrayList r4 = new java.util.ArrayList
            r4.<init>()
            boolean r6 = r8 instanceof com.blank.bm15.model.object.crud.Player
            if (r6 == 0) goto L3e
            com.blank.bm15.dao.BlankDatabaseManagement r2 = openDatabase(r8)
            r1 = 0
            java.lang.String r5 = getQueryDraftPlayers(r8)     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            android.database.sqlite.SQLiteDatabase r6 = r2.getReadableDatabase()     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            r7 = 0
            android.database.Cursor r1 = r6.rawQuery(r5, r7)     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            boolean r6 = r1.moveToFirst()     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            if (r6 == 0) goto L36
        L21:
            com.blank.bm15.model.object.crud.Player r0 = new com.blank.bm15.model.object.crud.Player     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            android.content.Context r6 = r8.getContext()     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            r0.<init>(r6)     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            putCursorValuesInObject(r1, r0)     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            r4.add(r0)     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            boolean r6 = r1.moveToNext()     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            if (r6 != 0) goto L21
        L36:
            if (r1 == 0) goto L3b
            r1.close()
        L3b:
            closeDatabase(r2)
        L3e:
            return r4
        L3f:
            r3 = move-exception
            java.lang.String r6 = getTableName(r8)     // Catch: java.lang.Throwable -> L54
            java.lang.String r7 = r3.toString()     // Catch: java.lang.Throwable -> L54
            android.util.Log.e(r6, r7)     // Catch: java.lang.Throwable -> L54
            if (r1 == 0) goto L50
            r1.close()
        L50:
            closeDatabase(r2)
            goto L3e
        L54:
            r6 = move-exception
            if (r1 == 0) goto L5a
            r1.close()
        L5a:
            closeDatabase(r2)
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: com.blank.bm15.dao.BlankDaoExtra.getDraftPlayers(com.blank.bm15.model.object.crud.Player):java.util.List");
    }

    private static String getQueryDraftPlayers(Player obj) {
        String where = " WHERE game = " + obj.getGame().getId() + " AND team = -1";
        return String.valueOf("SELECT * FROM Player") + where;
    }

    /* JADX WARN: Code restructure failed: missing block: B:12:0x0036, code lost:

        if (r1 == null) goto L11;
     */
    /* JADX WARN: Code restructure failed: missing block: B:13:0x0038, code lost:

        r1.close();
     */
    /* JADX WARN: Code restructure failed: missing block: B:14:0x003b, code lost:

        closeDatabase(r2);
     */
    /* JADX WARN: Code restructure failed: missing block: B:6:0x001f, code lost:

        if (r1.moveToFirst() != false) goto L7;
     */
    /* JADX WARN: Code restructure failed: missing block: B:7:0x0021, code lost:

        r0 = new com.blank.bm15.model.object.crud.Match(r8.getContext());
        putCursorValuesInObject(r1, r0);
        r4.add(r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:8:0x0034, code lost:

        if (r1.moveToNext() != false) goto L27;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.util.List<com.blank.bm15.model.object.crud.Match> getUserMatchCalendar(com.blank.bm15.model.object.crud.Match r8) {
        /*
            java.util.ArrayList r4 = new java.util.ArrayList
            r4.<init>()
            boolean r6 = r8 instanceof com.blank.bm15.model.object.crud.Match
            if (r6 == 0) goto L3e
            com.blank.bm15.dao.BlankDatabaseManagement r2 = openDatabase(r8)
            r1 = 0
            java.lang.String r5 = getQueryUserMatchCalendar(r8)     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            android.database.sqlite.SQLiteDatabase r6 = r2.getReadableDatabase()     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            r7 = 0
            android.database.Cursor r1 = r6.rawQuery(r5, r7)     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            boolean r6 = r1.moveToFirst()     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            if (r6 == 0) goto L36
        L21:
            com.blank.bm15.model.object.crud.Match r0 = new com.blank.bm15.model.object.crud.Match     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            android.content.Context r6 = r8.getContext()     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            r0.<init>(r6)     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            putCursorValuesInObject(r1, r0)     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            r4.add(r0)     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            boolean r6 = r1.moveToNext()     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            if (r6 != 0) goto L21
        L36:
            if (r1 == 0) goto L3b
            r1.close()
        L3b:
            closeDatabase(r2)
        L3e:
            return r4
        L3f:
            r3 = move-exception
            java.lang.String r6 = getTableName(r8)     // Catch: java.lang.Throwable -> L54
            java.lang.String r7 = r3.toString()     // Catch: java.lang.Throwable -> L54
            android.util.Log.e(r6, r7)     // Catch: java.lang.Throwable -> L54
            if (r1 == 0) goto L50
            r1.close()
        L50:
            closeDatabase(r2)
            goto L3e
        L54:
            r6 = move-exception
            if (r1 == 0) goto L5a
            r1.close()
        L5a:
            closeDatabase(r2)
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: com.blank.bm15.dao.BlankDaoExtra.getUserMatchCalendar(com.blank.bm15.model.object.crud.Match):java.util.List");
    }

    private static String getQueryUserMatchCalendar(Match obj) {
        String where = " WHERE game = " + obj.getGame().getId() + " AND (teamLocal = " + obj.getGame().getUserTeam().getId() + " OR teamVisitor = " + obj.getGame().getUserTeam().getId() + ")";
        if (obj.getMatchday() != null) {
            where = String.valueOf(where) + " AND matchday = " + obj.getMatchday();
        }
        return String.valueOf("SELECT * FROM Match") + where + " ORDER BY matchday ASC";
    }

    /* JADX WARN: Code restructure failed: missing block: B:12:0x0036, code lost:

        if (r1 == null) goto L11;
     */
    /* JADX WARN: Code restructure failed: missing block: B:13:0x0038, code lost:

        r1.close();
     */
    /* JADX WARN: Code restructure failed: missing block: B:14:0x003b, code lost:

        closeDatabase(r2);
     */
    /* JADX WARN: Code restructure failed: missing block: B:6:0x001f, code lost:

        if (r1.moveToFirst() != false) goto L7;
     */
    /* JADX WARN: Code restructure failed: missing block: B:7:0x0021, code lost:

        r0 = new com.blank.bm15.model.object.crud.Match(r8.getContext());
        putCursorValuesInObject(r1, r0);
        r4.add(r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:8:0x0034, code lost:

        if (r1.moveToNext() != false) goto L27;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.util.List<com.blank.bm15.model.object.crud.Match> getPlayedMatchesTeam(com.blank.bm15.model.object.crud.Match r8) {
        /*
            java.util.ArrayList r4 = new java.util.ArrayList
            r4.<init>()
            boolean r6 = r8 instanceof com.blank.bm15.model.object.crud.Match
            if (r6 == 0) goto L3e
            com.blank.bm15.dao.BlankDatabaseManagement r2 = openDatabase(r8)
            r1 = 0
            java.lang.String r5 = getQueryPlayedMatchesTeam(r8)     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            android.database.sqlite.SQLiteDatabase r6 = r2.getReadableDatabase()     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            r7 = 0
            android.database.Cursor r1 = r6.rawQuery(r5, r7)     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            boolean r6 = r1.moveToFirst()     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            if (r6 == 0) goto L36
        L21:
            com.blank.bm15.model.object.crud.Match r0 = new com.blank.bm15.model.object.crud.Match     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            android.content.Context r6 = r8.getContext()     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            r0.<init>(r6)     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            putCursorValuesInObject(r1, r0)     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            r4.add(r0)     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            boolean r6 = r1.moveToNext()     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            if (r6 != 0) goto L21
        L36:
            if (r1 == 0) goto L3b
            r1.close()
        L3b:
            closeDatabase(r2)
        L3e:
            return r4
        L3f:
            r3 = move-exception
            java.lang.String r6 = getTableName(r8)     // Catch: java.lang.Throwable -> L54
            java.lang.String r7 = r3.toString()     // Catch: java.lang.Throwable -> L54
            android.util.Log.e(r6, r7)     // Catch: java.lang.Throwable -> L54
            if (r1 == 0) goto L50
            r1.close()
        L50:
            closeDatabase(r2)
            goto L3e
        L54:
            r6 = move-exception
            if (r1 == 0) goto L5a
            r1.close()
        L5a:
            closeDatabase(r2)
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: com.blank.bm15.dao.BlankDaoExtra.getPlayedMatchesTeam(com.blank.bm15.model.object.crud.Match):java.util.List");
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

    /* JADX WARN: Code restructure failed: missing block: B:12:0x0036, code lost:

        if (r1 == null) goto L11;
     */
    /* JADX WARN: Code restructure failed: missing block: B:13:0x0038, code lost:

        r1.close();
     */
    /* JADX WARN: Code restructure failed: missing block: B:14:0x003b, code lost:

        closeDatabase(r2);
     */
    /* JADX WARN: Code restructure failed: missing block: B:6:0x001f, code lost:

        if (r1.moveToFirst() != false) goto L7;
     */
    /* JADX WARN: Code restructure failed: missing block: B:7:0x0021, code lost:

        r0 = new com.blank.bm15.model.object.other.Classification(r8.getContext());
        putCursorValuesInObject(r1, r0);
        r4.add(r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:8:0x0034, code lost:

        if (r1.moveToNext() != false) goto L27;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.util.List<com.blank.bm15.model.object.other.Classification> getDraft(com.blank.bm15.model.object.other.Classification r8) {
        /*
            java.util.ArrayList r4 = new java.util.ArrayList
            r4.<init>()
            boolean r6 = r8 instanceof com.blank.bm15.model.object.other.Classification
            if (r6 == 0) goto L3e
            com.blank.bm15.dao.BlankDatabaseManagement r2 = openDatabase(r8)
            r1 = 0
            java.lang.String r5 = getQueryDraft(r8)     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            android.database.sqlite.SQLiteDatabase r6 = r2.getReadableDatabase()     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            r7 = 0
            android.database.Cursor r1 = r6.rawQuery(r5, r7)     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            boolean r6 = r1.moveToFirst()     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            if (r6 == 0) goto L36
        L21:
            com.blank.bm15.model.object.other.Classification r0 = new com.blank.bm15.model.object.other.Classification     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            android.content.Context r6 = r8.getContext()     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            r0.<init>(r6)     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            putCursorValuesInObject(r1, r0)     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            r4.add(r0)     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            boolean r6 = r1.moveToNext()     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            if (r6 != 0) goto L21
        L36:
            if (r1 == 0) goto L3b
            r1.close()
        L3b:
            closeDatabase(r2)
        L3e:
            return r4
        L3f:
            r3 = move-exception
            java.lang.String r6 = getTableName(r8)     // Catch: java.lang.Throwable -> L54
            java.lang.String r7 = r3.toString()     // Catch: java.lang.Throwable -> L54
            android.util.Log.e(r6, r7)     // Catch: java.lang.Throwable -> L54
            if (r1 == 0) goto L50
            r1.close()
        L50:
            closeDatabase(r2)
            goto L3e
        L54:
            r6 = move-exception
            if (r1 == 0) goto L5a
            r1.close()
        L5a:
            closeDatabase(r2)
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: com.blank.bm15.dao.BlankDaoExtra.getDraft(com.blank.bm15.model.object.other.Classification):java.util.List");
    }

    private static String getQueryDraft(Classification obj) {
        String where = " WHERE team.game = league.game AND team.id = league.team";
        if (obj.getGame() != null && obj.getGame().getId() != null) {
            where = String.valueOf(" WHERE team.game = league.game AND team.id = league.team") + " AND team.game = " + obj.getGame().getId();
        }
        return String.valueOf("SELECT league.game AS game, league.team AS team, league.gamesLost AS gamesLost, league.gamesWon AS gamesWon, league.pointsAllowed AS pointsAllowed, league.pointsScored AS pointsScored, team.name AS name, team.conference AS conference, team.division AS division FROM Team team, League league") + where + " ORDER BY league.gamesWon ASC, league.pointsScored ASC, league.pointsAllowed DESC";
    }

    /* JADX WARN: Code restructure failed: missing block: B:12:0x0036, code lost:

        if (r1 == null) goto L11;
     */
    /* JADX WARN: Code restructure failed: missing block: B:13:0x0038, code lost:

        r1.close();
     */
    /* JADX WARN: Code restructure failed: missing block: B:14:0x003b, code lost:

        closeDatabase(r2);
     */
    /* JADX WARN: Code restructure failed: missing block: B:6:0x001f, code lost:

        if (r1.moveToFirst() != false) goto L7;
     */
    /* JADX WARN: Code restructure failed: missing block: B:7:0x0021, code lost:

        r0 = new com.blank.bm15.model.object.crud.Match(r8.getContext());
        putCursorValuesInObject(r1, r0);
        r4.add(r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:8:0x0034, code lost:

        if (r1.moveToNext() != false) goto L27;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.util.List<com.blank.bm15.model.object.crud.Match> getMatchesToDeleteByPlayoffs(com.blank.bm15.model.object.crud.Playoffs r8) {
        /*
            java.util.ArrayList r4 = new java.util.ArrayList
            r4.<init>()
            boolean r6 = r8 instanceof com.blank.bm15.model.object.crud.Playoffs
            if (r6 == 0) goto L3e
            com.blank.bm15.dao.BlankDatabaseManagement r2 = openDatabase(r8)
            r1 = 0
            java.lang.String r5 = getQueryMatchesToDeleteByPlayoffs(r8)     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            android.database.sqlite.SQLiteDatabase r6 = r2.getReadableDatabase()     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            r7 = 0
            android.database.Cursor r1 = r6.rawQuery(r5, r7)     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            boolean r6 = r1.moveToFirst()     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            if (r6 == 0) goto L36
        L21:
            com.blank.bm15.model.object.crud.Match r0 = new com.blank.bm15.model.object.crud.Match     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            android.content.Context r6 = r8.getContext()     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            r0.<init>(r6)     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            putCursorValuesInObject(r1, r0)     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            r4.add(r0)     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            boolean r6 = r1.moveToNext()     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L54
            if (r6 != 0) goto L21
        L36:
            if (r1 == 0) goto L3b
            r1.close()
        L3b:
            closeDatabase(r2)
        L3e:
            return r4
        L3f:
            r3 = move-exception
            java.lang.String r6 = getTableName(r8)     // Catch: java.lang.Throwable -> L54
            java.lang.String r7 = r3.toString()     // Catch: java.lang.Throwable -> L54
            android.util.Log.e(r6, r7)     // Catch: java.lang.Throwable -> L54
            if (r1 == 0) goto L50
            r1.close()
        L50:
            closeDatabase(r2)
            goto L3e
        L54:
            r6 = move-exception
            if (r1 == 0) goto L5a
            r1.close()
        L5a:
            closeDatabase(r2)
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: com.blank.bm15.dao.BlankDaoExtra.getMatchesToDeleteByPlayoffs(com.blank.bm15.model.object.crud.Playoffs):java.util.List");
    }

    private static String getQueryMatchesToDeleteByPlayoffs(Playoffs obj) {
        String where = " WHERE (match.teamLocal = playoffs.team OR match.teamVisitor = playoffs.team) AND playoffs.seriesGamesWon = " + obj.getSeriesGamesWon() + " AND match.game = " + obj.getGame().getId() + " AND match.matchday > " + obj.getGame().getCurrentMatchday();
        return String.valueOf("SELECT match.id FROM Match match, Playoffs playoffs") + where;
    }
}
